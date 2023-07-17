import RxSwift

protocol Repository {
    func getAddons() -> Single<AddonsResponse>
}
