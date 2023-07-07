//
//  SetupVM.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import RxSwift
import RxCocoa

class SetupVM: BaseVM {
    
    let setupsS: PublishSubject<[Setup]> = PublishSubject()
    
    override init() {
        super.init()
        
        trigger.asObservable()
            .flatMapLatest { _ -> Observable<[Setup]> in
                self.getSetups()
            }
            .subscribe(onNext: {[weak self] setups in
                guard let self = self else { return }
                let itemsFromIndex4 = Array(setups.suffix(from: 4))
                self.setupsS.onNext(itemsFromIndex4)
            }).disposed(by: bag)
        
    }
    
    func fetchData(){
        trigger.accept(())
    }
    
    private func getSetups() -> Observable<[Setup]> {
        return repository.getSetups()
    }
}

