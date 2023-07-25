import RxSwift

protocol Repository {
    
    func getAddons() -> Single<[Addon]>
    
    func getFavoritedAddons() -> Observable<[Addon]>
    
    func addFavoritedAddon(_ addon: Addon) -> Observable<Addon>
    
    func deleteFavoritedAddon(_ addon: Addon) -> Observable<Void>
    
}
