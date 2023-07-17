import RxSwift
import RxCocoa

class RepositoryImp: Repository {
    
    static let shared = RepositoryImp()
    private init() {}
    
    let apiService: ApiService = ApiServiceImp()
    
    func getKnots() -> Single<ListKnotResponse> {
        return apiService.getKnots()
    }
    
    func getDetailKnot(id: String) -> Single<KnotResponse> {
        return apiService.getDetailKnot(id: id)
    }
}
