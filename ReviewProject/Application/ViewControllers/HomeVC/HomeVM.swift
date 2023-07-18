import RxSwift
import RxCocoa

class HomeVM: BaseVM {
    let addonsS = PublishSubject<[Addon]>()
    
    override init() {
        super.init()
        
        trigger
            .asObservable()
            .flatMapLatest { _ -> Observable<[Addon]> in
                self.repository.getAddons()
                    .map { $0 }
                    .asObservable()
            }
            .subscribe(onNext: {[weak self] addons in
                guard let self = self else { return }
                self.addonsS.onNext(addons)
            }, onError: {[weak self] error in
                guard let _ = self else { return }
                //MARK: - handle error
            }).disposed(by: bag)
    }
    
    func fetchData() {
        trigger.accept(())
    }
}
