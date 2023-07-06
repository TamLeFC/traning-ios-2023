//
//  SetupVM.swift
//  course2
//
//  Created by Sơn Lê on 21/05/2023.
//

import Foundation

class SetupVM: BaseVM {
    
    private var allSetups: [Setup] = []
    private var setups: [Setup] = []
    
    override init() {
        super.init()
        allSetups = repository.getSetups()
        setups = Array(allSetups[4..<allSetups.count])
    }
    
    func fetchData() {
        
    }
}
