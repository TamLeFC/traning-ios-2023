import RxSwift
import Moya
import ObjectMapper

final class ApiServiceImp: ApiService {

    var appNetwork: AppNetwork = AppNetworkImp()
    
    //MARK: -- Demo
    
    func getAddons() -> Single<[Addon]> {
        return appNetwork.requestArray(.addons, type: Addon.self)
    }
    
    //MARK: App

    
}
