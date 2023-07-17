import RxSwift
import RxCocoa

class KnotDetailVM: BaseVM {
    let knotS = PublishSubject<Knot>()
    
    private let id: String
    
    init(id: String) {
        self.id = id
        super.init()
        
        trigger
            .asObservable()
            .flatMapLatest { _ -> Observable<[Knot]> in
                self.repository.getDetailKnot(id: id)
                    .map { $0.data }
                    .asObservable()
            }
            .subscribe(onNext: {[weak self] knot in
                guard let self = self else { return }
                self.knotS.onNext(knot.first!)
            }, onError: {[weak self] error in
                guard let _ = self else { return }
                //MARK: - handle error
            }).disposed(by: bag)
    }
    
    func fetchData() {
        trigger.accept(())
    }
}
