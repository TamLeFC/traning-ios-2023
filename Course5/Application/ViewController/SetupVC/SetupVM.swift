//
//  SetupVM.swift
//  Course5
//
//  Created by KietKoy on 27/06/2023.
//

import Foundation
import RxSwift
import RxCocoa
class SetupVM: BaseVM {
    
    let setupS = PublishSubject<[Setup]>()
    
    private var setups: [Setup] = []
    
    func fetchData() {
        respository.getSetups()
            .subscribe(onNext: {[weak self] setups in
                guard let self = self else {
                    return
                }
                self.setupS.onNext(setups)
            }).disposed(by: bag)
    }
}
