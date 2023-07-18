import RxSwift
import RxCocoa

class ListAddonVM: BaseVM {
    let addonsS = PublishSubject<[Addon]>()
    
    //    let favoritedTrigger = PublishRelay<Addon>()
    
    private let pageIndex: Int
    
    init(pageIndex: Int) {
        self.pageIndex = pageIndex
        super.init()
        
        trigger
            .asObservable()
            .flatMapLatest { _ -> Observable<[Addon]> in
                self.getAddons()
            }
            .subscribe(onNext: {[weak self] addons in
                guard let self = self else { return }
                self.addonsS.onNext(addons)
            }, onError: {[weak self] error in
                guard let _ = self else { return }
                //MARK: - handle error
            }).disposed(by: bag)
        
        //        favoritedTrigger
        //            .asObservable()
        //            .flatMapLatest { addon -> Observable<Void> in
        //                self.setFavoritedAddon(addon)
        //            }
        //            .subscribe(onNext: {[weak self] addons in
        //                guard let _ = self else { return }
        //            }, onError: {[weak self] error in
        //                guard let _ = self else { return }
        //                //MARK: - handle error
        //            }).disposed(by: bag)
    }
    
    func fetchData() {
        trigger.accept(())
    }
}

extension ListAddonVM {
    //    func getAddons() -> Observable<[Addon]> {
    //        if (pageIndex != 0) {
    //            return repository.getFavoritedAddon()
    //                .map { $0 }
    //                .asObservable()
    //        } else {
    //            return repository.getAddons()
    //                .map { $0 }
    //                .asObservable()
    //        }
    //    }
    
    func getAddons() -> Observable<[Addon]> {
        if pageIndex != 0 {
            return repository.getFavoritedAddons()
                .flatMap { favoritedAddons -> Single<[Addon]> in
                    let favoritedAddonIds = favoritedAddons.map { $0.itemId }
                    
                    return self.repository.getAddons()
                        .map { allAddons in
                            let filteredAddons = allAddons.filter { favoritedAddonIds.contains($0.itemId) }
                            return filteredAddons
                        }
                }
                .asObservable()
        } else {
            return repository.getAddons()
                .map { $0 }
                .asObservable()
        }
    }
    
    //    func setFavoritedAddon(_ addon: Addon) -> Observable<Void> {
    //        if (addon.isFavorited) {
    //            return repository.deleteFavoritedAddon(addon)
    //        } else {
    //            return repository.addFavoritedAddon(addon).map {_ in return () }
    //        }
    //    }
}
