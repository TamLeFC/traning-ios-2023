//
//  HomeVM.swift
//  course2
//
//  Created by Sơn Lê on 19/05/2023.
//

import RxSwift
import RxCocoa

class HomeVM: BaseVM {
    
    let categoriesS = PublishSubject<[Category]>()
    
    override init() {
        super.init()
        
        trigger.asObservable()
            .flatMapLatest { _ -> Observable<[Category]> in
                self.getCategories()
            }
            .subscribe(onNext: {[weak self] categories in
                guard let self = self else { return }
                self.categoriesS.onNext(categories)
            }).disposed(by: bag)
    }
    
    func fetchData() {
        trigger.accept(())
    }
    
    private func getCategories() -> Observable<[Category]> {
        return repository.getCategories()
    }
}
