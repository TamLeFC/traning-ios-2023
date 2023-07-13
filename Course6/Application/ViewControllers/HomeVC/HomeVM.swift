import RxSwift
import RxCocoa

class HomeVM: BaseVM {
    let knotsS = PublishSubject<[Knot]>()
    
    override init() {
        super.init()
        
        trigger
            .asObservable()
            .flatMapLatest { _ -> Observable<[Knot]> in
                self.repository.getKnots()
                    .map { $0.data }
                    .asObservable()
            }
            .subscribe(onNext: {[weak self] knots in
                guard let self = self else { return }
                self.knotsS.onNext(knots)
            }, onError: {[weak self] error in
                guard let _ = self else { return }
                //MARK: - handle error
            }).disposed(by: bag)
    }
    
    func fetchData() {
        trigger.accept(())
    }
}
