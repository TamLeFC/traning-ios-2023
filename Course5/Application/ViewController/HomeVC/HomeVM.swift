import RxSwift

class HomeVM: BaseVM {
    
    let categoriesSub = PublishSubject<[Category]>()
    
    private var categories: [Category] = []
    
    func fetchData() {
        repository.getCommands()
            .subscribe(onNext: {[weak self] categories in
                guard let self = self else { return }
                self.categoriesSub.onNext(categories)
            }).disposed(by: bag)
    }
}
