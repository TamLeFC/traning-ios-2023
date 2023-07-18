//
//  HomeVM.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import Foundation
import RxSwift

class HomeVM: BaseVM {
    let addonsS = PublishSubject<[Addon]>()
    
    override init() {
        super.init()
        
        trigger
            .asObservable()
            .flatMapLatest { _ -> Observable<[Addon]> in
                self.respository.getListAddon()
                    .asObservable()
            }
            .subscribe(onNext: {[weak self] knots in
                guard let self = self else { return }
                self.addonsS.onNext(knots)
            }, onError: {[weak self] error in
                guard let _ = self else { return }
                //MARK: - handle error
            }).disposed(by: bag)
    }
    
    func fetchData() {
        trigger.accept(())
    }
}
