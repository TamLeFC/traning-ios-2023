//
//  CommandDetailVM.swift
//  Course5
//
//  Created by KietKoy on 03/07/2023.
//

import Foundation
import RxSwift

class CommandDetailVM: BaseVM {
    
    let dataS:PublishSubject<Category> = PublishSubject()
    
    private let category: Category
    
    init(_ category: Category) {
        self.category = category
    }
    
    func fetchData() {
        dataS.onNext(category)
    }
}
