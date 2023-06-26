//
//  SetupVM.swift
//  course2
//
//  Created by Sơn Lê on 21/05/2023.
//

import Foundation

class SetupVM {
    
    private var allSetups: [Setup] = []
    var setups: [Setup] = []
    
    private let repository = Repository()
    
    init() {
        allSetups = repository.getSetups()
        setups = Array(allSetups[4..<allSetups.count])
    }
}
