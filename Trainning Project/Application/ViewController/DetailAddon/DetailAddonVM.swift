//
//  DetailAddonVM.swift
//  Trainning Project
//
//  Created by KietKoy on 19/07/2023.
//

import Foundation
import RxSwift
import RxRelay

class DetailAddonVM: BaseVM {
    
    var favoritedTrigger = PublishRelay<Addon>()
    
    let addonS: PublishSubject<Addon> = PublishSubject()
    
    init(_ item: Addon) {
        super.init()
        
        trigger
            .flatMapLatest { _ -> Observable<Addon> in
                return Observable.just(item)
            }
            .subscribe(onNext: {[weak self] addon in
                guard let self = self else { return }
                self.addonS.onNext(addon)
            }, onError: {[weak self] error in
                guard let _ = self else { return }
            }).disposed(by: bag)
        
        favoritedTrigger
            .asObservable()
            .flatMapLatest { addon -> Observable<Void> in
                if (addon.isFavorite) {
                    return self.respository.deleteFavorited(addon)
                } else {
                    return self.respository.addFavoriteds(addon).map {_ in return () }
                }
            }
            .subscribe(onNext: {[weak self] addons in
                guard let _ = self else { return }
            }, onError: {[weak self] error in
                guard let _ = self else { return }
                //MARK: - handle error
            }).disposed(by: bag)
    }
    
    func fetchData() {
        trigger.accept(())
    }
    
    func favoriteChanged(_ item: Addon) {
        favoritedTrigger.accept(item)
    }
    
}
