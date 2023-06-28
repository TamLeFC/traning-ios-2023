import RxSwift

class HomeVM {
    
    let categoriesSub = PublishSubject<[Category]>()
    
    private var categories: [Category] = []
    
    private let repository = CommandRepository()
    
    private let bag = DisposeBag()
    
    func fetchData() {
        repository.getCommands()
            .subscribe(onNext: {[weak self] categories in
                guard let self = self else { return }
                self.categoriesSub.onNext(categories)
            }).disposed(by: bag)
    }
}
