//
//  DetailVM.swift
//  TrainingProject
//
//  Created by Mobile Dev on 18/07/2023.
//

import RxSwift
import RxCocoa

class DetailVM: BaseVM {
    let mineCraftS = PublishSubject<MineCraft>()
    
    private let mineCraft: MineCraft
    
    init(_ mineCraft: MineCraft) {
        self.mineCraft = mineCraft
        super.init()
        
        trigger
            .asObservable()
            .flatMapLatest { [unowned self] _ -> Observable<MineCraft> in
                return Observable.just(self.mineCraft)
            }
            .subscribe(onNext: { [weak self] mineCraft in
                self?.mineCraftS.onNext(mineCraft)
            })
            .disposed(by: bag)
    }
}
