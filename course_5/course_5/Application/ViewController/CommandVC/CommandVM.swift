//
//  CommandVM.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import RxSwift
import RxCocoa

class CommandVM {
    
    let categoriesS = PublishSubject<[Category]>()
    
    private var categories: [Category] = []
    
    private let repository = Repository()
    
    private let bag = DisposeBag()
    
    var categoriesObservable: Observable<[Category]> {
            return categoriesS.asObservable()
        }
    
    func fetchData(){
        repository.getCommands()
            .subscribe(onNext: {[weak self] categories in
                guard let self = self else {return}
                self.categoriesS.onNext(categories)
            }).disposed(by: bag)
    }
}
