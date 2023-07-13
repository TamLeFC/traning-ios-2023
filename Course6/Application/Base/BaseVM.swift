import RxSwift
import RxCocoa

class BaseVM {
    
    let bag = DisposeBag()
    let repository = RepositoryImp.shared
    
    let trigger = PublishRelay<Void>()
    
    deinit {
        print("deinit :: >>>> \(String(describing: self)) <<<<")
    }
}
