import RxSwift

class SetupVM: BaseVM {
    
    let setupsSub = PublishSubject<[Setup]>()
    
    private var setups: [Setup] = []
    
    func fetchData() {
        repository.getSetups()
            .subscribe(onNext: {[weak self] setups in
                guard let self = self else { return }
                self.setupsSub.onNext(setups)
            }).disposed(by: bag)
    }
}
