import RxSwift
import RxCocoa

class RepositoryImp: Repository {
    
    static let shared = RepositoryImp()
    private init() {}
    
    let apiService: ApiService = ApiServiceImp()
    
    func getAddons() -> Single<[Addon]> {
        return apiService.getAddons()
    }
}
