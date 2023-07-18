import RxSwift

protocol ApiService {
    func getAddons() -> Single<[Addon]>
}
