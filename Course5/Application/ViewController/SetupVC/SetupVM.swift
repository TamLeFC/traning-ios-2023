import RxSwift

class SetupVM {
    
    let setupsSub = PublishSubject<[Setup]>()
    
    private var setups: [Setup] = []
    
    private let repository = SetupRepository()
    
    private let bag = DisposeBag()
    
    func fetchData() {
        repository.getSetups()
            .subscribe(onNext: {[weak self] setups in
                guard let self = self else { return }
                self.setupsSub.onNext(setups)
            }).disposed(by: bag)
    }
}
