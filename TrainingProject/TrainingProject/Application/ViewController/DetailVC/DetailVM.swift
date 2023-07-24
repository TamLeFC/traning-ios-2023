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
    
    let favoriteTrigger = PublishRelay<MineCraft>()
    
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
        
        favoriteTrigger
            .asObservable()
            .flatMapLatest { mineCraft -> Observable<Void> in
                if (mineCraft.isFavorited) {
                    return self.repository.deleteFavorited(mineCraft)
                } else {
                    return self.repository.addFavoriteds(mineCraft).map {_ in return () }
                }
            }
            .subscribe(onNext: {[weak self] mineCraft in
                guard let _ = self else { return }
            }, onError: {[weak self] error in
                guard let _ = self else { return }
                //MARK: - handle error
            }).disposed(by: bag)
    }
    
    func favoriteChanged(_ item: MineCraft) {
        favoriteTrigger.accept(item)
    }
    
    func checkIsFavorited() -> Observable<Bool> {
        let favMineCrafts = repository.getFavoriteds()
        favMineCrafts.subscribe(onNext: { mc in
            print(mc)
        }).disposed(by: bag)
        return favMineCrafts.map { mineCrafts in
            let itemIdToCheck = self.mineCraft.itemId
            print(itemIdToCheck)
            return mineCrafts.contains { $0.itemId == itemIdToCheck } ? true : false
        }
    }
}
