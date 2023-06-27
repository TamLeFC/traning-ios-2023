//
//  HomeVM.swift
//  Course5
//
//  Created by KietKoy on 26/06/2023.
//

import Foundation

class HomeVM {
    var categories: [Category]
    init() {
        categories = Respository().getCommands()
    }
}
