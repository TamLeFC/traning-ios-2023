//
//  CommandVM.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import Foundation

class CommandVM {
    var categories: [Category] = []
    
    private let repository = Repository()
    
    init() {
        categories = repository.getCommands()
    }
}
