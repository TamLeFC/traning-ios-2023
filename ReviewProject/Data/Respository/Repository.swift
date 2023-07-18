import RxSwift

protocol Repository {
    func getAddons() -> Single<[Addon]>
}
