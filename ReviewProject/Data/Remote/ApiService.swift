import RxSwift

protocol ApiService {
    func getKnots() -> Single<ListKnotResponse>
    func getDetailKnot(id: String) -> Single<KnotResponse>
}
