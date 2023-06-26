//
//  CommandVM.swift
//  course2
//
//  Created by Sơn Lê on 21/05/2023.
//

import Foundation

class CommandVM {
    
    let category: Category
    let commands: [Command]
    
    init(_ category: Category) {
        self.category = category
        self.commands = category.commands
    }    
}
