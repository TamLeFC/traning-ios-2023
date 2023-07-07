//
//  HomeVM.swift
//  Course5
//
//  Created by KietKoy on 26/06/2023.
//

import Foundation
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
        return respository.getCategories()
    }
}
