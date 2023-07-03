//
//  CommandVM.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import RxSwift
import RxCocoa

class CommandVM: BaseVM {
    
    let categoriesS = PublishSubject<[Category]>()
    
    var categories: [Category] = []
    
    var categoriesObservable: Observable<[Category]> {
            return categoriesS.asObservable()
        }
    
    func fetchData(){
        repository.getCommands()
            .subscribe(onNext: {[weak self] categories in
                guard let self = self else { return }
                self.categories = categories
                self.categoriesS.onNext(categories)
            }).disposed(by: bag)
    }
}

