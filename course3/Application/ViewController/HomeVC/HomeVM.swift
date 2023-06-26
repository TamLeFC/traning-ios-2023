//
//  HomeVM.swift
//  course2
//
//  Created by Sơn Lê on 19/05/2023.
//

import Foundation

class HomeVM {
    var categories: [Category] = []
    
    private let repository = Repository()
    
    init() {
        categories = repository.getCommands()
    }
}
