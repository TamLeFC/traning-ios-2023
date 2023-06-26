//
//  VoiceVM.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import Foundation

class VoiceVM {
    
    let category: Category
    let commands: [Command]
    
    init(_ category: Category) {
        self.category = category
        self.commands = category.commands
    }
}
