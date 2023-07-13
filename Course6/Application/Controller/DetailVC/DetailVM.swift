//
//  DetailVM.swift
//  Course6
//
//  Created by KietKoy on 13/07/2023.
//

import Foundation
import RxSwift

class DetailVM: BaseVM {
    let detailKnotS = PublishSubject<DetailKnot>()
    
    init(id: String) {
        super.init()
        
        trigger
            .asObservable()
            .flatMapLatest { _ -> Observable<[DetailKnot]> in
                self.respository.getDetailKnot(id: id)
                    .map { $0.data }
                    .asObservable()
            }
            .subscribe(onNext: {[weak self] knots in
                guard let self = self else { return }
                self.detailKnotS.onNext(knots.first!)
            }, onError: {[weak self] error in
                guard let _ = self else { return }
                //MARK: - handle error
            }).disposed(by: bag)
    }
    
    func fetchData() {
        trigger.accept(())
    }
}

