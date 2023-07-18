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
    var addonsS: PublishSubject<[Addon]>  = PublishSubject()
    
    override init() {
        super.init()
        
        trigger
            .asObservable()
            .flatMapLatest { _ -> Observable<[Addon]> in
                self.getAddonsFavorite()
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
    
    private func getAddonsFavorite() -> Observable<[Addon]> {
        Observable.combineLatest(respository.getListAddon().asObservable(), respository.getFavoriteds())
            .map { (listAddon, listFavoriteds) -> [Addon] in
                return listAddon.filter { addon in
                    return listFavoriteds.contains { $0.itemID == addon.itemID }
                }
            }
    }
}
