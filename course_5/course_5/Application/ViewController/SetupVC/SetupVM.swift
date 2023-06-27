//
//  SetupVM.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import Foundation

class SetupVM {
    
    private var allSetups: [Setup] = []
    var setups: [Setup] = []
    
    private let repository = Repository()
    
    init() {
        allSetups = repository.getSetups()
        
        if allSetups.count > 4 {
            setups = Array(allSetups[4..<allSetups.count])
        } else {
            setups = []
        }
    }
}

