//
//  FavoriteVM.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import RxSwift
import RxCocoa

class FavoriteVM: BaseVM {
    let mineCraftsS = PublishSubject<[MineCraft]>()
    
    override init() {
        super.init()
        
        trigger
            .asObservable()
            .flatMapLatest{_ -> Observable<[MineCraft]> in
                self.repository.getFavoriteds().asObservable()
            }
            .subscribe(onNext: {[weak self] mineCraft in
                guard let self = self else { return }
                self.mineCraftsS.onNext(mineCraft)
            }, onError: {[weak self] error in
                guard let _ = self else { return }
                //MARK: - handle error
            }).disposed(by: bag)
    }
}
