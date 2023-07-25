import RxSwift
import RxCocoa

class AddonDetailVM: BaseVM {
    let addonS = PublishSubject<Addon>()
    
    let favoritedTrigger = PublishRelay<Addon>()
    
    private let addon: Addon
    
    init(addon: Addon) {
        
        self.addon = addon
        super.init()
        
        trigger
            .flatMapLatest { _ -> Observable<Addon> in
                self.repository.getFavoritedAddons()
                    .map { favAddons -> Addon in
                        let favAddonIds = favAddons.map { $0.itemId }
                        return self.setIsFavorited(favAddonIds.contains(addon.itemId), for: addon)
                    }
            }
            .subscribe(onNext: { [weak self] addon in
                guard let self = self else { return }
                self.addonS.onNext(addon)
            }, onError: { [weak self] error in
                guard let _ = self else { return }
                // MARK: - handle error
            })
            .disposed(by: bag)
        
        favoritedTrigger
            .asObservable()
            .flatMapLatest { addon -> Observable<Void> in
                if (addon.isFavorited) {
                    return self.repository.deleteFavoritedAddon(addon)
                } else {
                    return self.repository.addFavoritedAddon(addon).map {_ in return () }
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
    
    private func setIsFavorited(_ isFavorited: Bool, for addon: Addon) -> Addon {
        
        var newItem = addon
        newItem.isFavorited = isFavorited
        return newItem
    }
    
}
