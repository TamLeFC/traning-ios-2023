//
//  VoiceVM.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import RxSwift

class VoiceVM: BaseVM {
    
    let dataS: PublishSubject<Category> = PublishSubject()
    var commands: [Command] = []
    
    var category: Observable<Category> {
        return dataS.asObservable()
    }
    
    init(_ category: Category) {
        super.init()
        self.getCommands(for: category)
    }
    
    func getCommands(for category: Category) {
        commands = category.commands
        dataS.onNext(category)
    }
}

