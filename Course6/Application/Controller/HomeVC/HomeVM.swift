//
//  HomeVM.swift
//  Course6
//
//  Created by KietKoy on 13/07/2023.
//

import Foundation
import RxSwift

class HomeVM: BaseVM {
    let knotS = PublishSubject<[Knot]>()
    
    override init() {
        super.init()
        
        trigger
            .asObservable()
            .flatMapLatest { _ -> Observable<[Knot]> in
                self.respository.getKnots()
                    .map { $0.data }
                    .asObservable()
            }
            .subscribe(onNext: {[weak self] knots in
                guard let self = self else { return }
                self.knotS.onNext(knots)
            }, onError: {[weak self] error in
                guard let _ = self else { return }
                //MARK: - handle error
            }).disposed(by: bag)
    }
    
    func fetchData() {
        trigger.accept(())
    }
}
