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
    
    let categorieS = PublishSubject<[Category]>()
    
    private var categories: [Category] = []
    
    func fetchData() {
        Respository().getCommands()
            .subscribe(onNext: {[weak self] categories in
                guard let self = self else {
                    return
                }
                self.categorieS.onNext(categories)
            }).disposed(by: bag)
    }
}
