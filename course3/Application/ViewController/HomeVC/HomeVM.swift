//
//  HomeVM.swift
//  course2
//
//  Created by Sơn Lê on 19/05/2023.
//

import RxSwift
import RxCocoa

class HomeVM {
    
    let categoriesS = PublishSubject<[Category]>()
    
    private var categories: [Category] = []
    
    private let repository = Repository()
    
    private let bag = DisposeBag()
    
    func fetchData() {
        repository.getCommands()
            .subscribe(onNext: {[weak self] categories in
                guard let self = self else { return }
                self.categoriesS.onNext(categories)
            }).disposed(by: bag)
    }
}
