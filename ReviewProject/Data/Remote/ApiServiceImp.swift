import RxSwift
import Moya
import ObjectMapper

final class ApiServiceImp: ApiService {

    var appNetwork: AppNetwork = AppNetworkImp()
    
    //MARK: -- Demo
    
    func getAddons() -> Single<AddonsResponse> {
        return appNetwork.requestObject(.addons, type: AddonsResponse.self)
    }
    
    //MARK: App

    
}
