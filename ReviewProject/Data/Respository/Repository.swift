import RxSwift

protocol Repository {
    func getKnots() -> Single<ListKnotResponse>
}
