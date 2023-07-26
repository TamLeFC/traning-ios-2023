//
//  FavoriteVM.swift
//  Trainning Project
//
//  Created by KietKoy on 18/07/2023.
//

import Foundation
import RxSwift
import RxCocoa

class FavoriteVM: BaseVM {
    var addonsS = PublishSubject<[Addon]>()
    
    override init() {
        super.init()
        
        trigger
            .asObservable()
            .flatMapLatest { _ -> Observable<[Addon]> in
                self.fetchAddonsSFavorite()
            }
            .subscribe(onNext: {[weak self] addons in
                guard let self = self else { return }
                self.addonsS.onNext(addons)
            }, onError: {[weak self] error in
                guard let _ = self else { return }
                //MARK: - handle error
            })
            .disposed(by: bag)
    }
    
    func fetchData() {
        trigger.accept(())
    }
    
    private func fetchAddonsSFavorite() -> Observable<[Addon]> {
        let favoritedsObservable = respository.getFavoriteds()

        return favoritedsObservable
            .map { addons in
                return self.updateAddonsSFavoriteState(addons)
            }
    }

    private func updateAddonsSFavoriteState(_ addons: [Addon]) -> [Addon] {
        return addons.map { addon in
            var updatedAddon = addon
            updatedAddon.isFavorite = true
            return updatedAddon
        }
    }
}

