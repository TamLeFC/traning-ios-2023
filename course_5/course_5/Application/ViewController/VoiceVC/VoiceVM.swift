//
//  VoiceVM.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import RxSwift

class VoiceVM: BaseVM {
    
    let dataS: PublishSubject<Category> = PublishSubject()
    
    let category: Category
    let commands: [Command]
    
    init(_ category: Category) {
        self.category = category
        self.commands = category.commands
        super.init()
        
        fetchData()
    }
    
    private func fetchData() {
        dataS.onNext(category)
    }
}

