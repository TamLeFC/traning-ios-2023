//
//  SetupVM.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import RxSwift
import RxCocoa

class SetupVM {
    
    let setupsS = PublishSubject<[Setup]>()
    
    private var setups: [Setup] = []
    
    private let repository = Repository()
    
    private let bag = DisposeBag()
    
    func fetchData(){
        repository.getSetups()
            .subscribe(onNext: {[weak self] setups in
                guard let self = self else { return }
                self.setupsS.onNext(setups)
            }).disposed(by: bag)
    }
    
    
}

