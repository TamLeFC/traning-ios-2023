import RxSwift
import Moya
import ObjectMapper

final class ApiServiceImp: ApiService {

    var appNetwork: AppNetwork = AppNetworkImp()
    
    //MARK: -- Demo
    
    func getKnots() -> Single<ListKnotResponse> {
        return appNetwork.requestObject(.knots, type: ListKnotResponse.self)
    }
    
    func getDetailKnot(id: String) -> Single<KnotResponse> {
        return appNetwork.requestObject(.detailKnot(id: id), type: KnotResponse.self)
    }
    //MARK: App

    
}
