import RxSwift
import RxCocoa

class RepositoryImp: Repository {
    static let shared = RepositoryImp()
    private init() {}
    
    private var addonDAO = AddonDAO(config: DBManager.shared().config)
    
    let apiService: ApiService = ApiServiceImp()
    
    func getAddons() -> Single<[Addon]> {
        return apiService.getAddons()
    }
    
    func getFavoritedAddons() -> Observable<[Addon]> {
        return addonDAO.findAll()
    }
    
    func addFavoritedAddon(_ addon: Addon) -> Observable<Addon> {
        return addonDAO.save(addon.asRealm())
    }
    
    func deleteFavoritedAddon(_ addon: Addon) -> Observable<Void> {
        return addonDAO.delete(addon.asRealm())
    }
}
