//
//  CommandVM.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import RxSwift
import RxCocoa

class CategoryVM: BaseVM {
    
    let categoriesS = PublishSubject<[Category]>()
    
    override init() {
        super.init()
        
        trigger.asObservable()
            .flatMapLatest{ _ -> Observable<[Category]> in
                self.getCategories()
            }
            .subscribe(onNext: {[weak self] categories in
                guard let self = self else { return }
                self.categoriesS.onNext(categories)
            }).disposed(by: bag)
    }
    
    func fetchData(){
        trigger.accept(())
    }
    
    private func getCategories() -> Observable<[Category]> {
        return repository.getCategories()
    }
}

