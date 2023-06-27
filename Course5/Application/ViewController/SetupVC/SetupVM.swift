//
//  SetupVM.swift
//  Course5
//
//  Created by KietKoy on 27/06/2023.
//

import Foundation

class SetupVM {
    var setups: [Setup] = []
    init() {
        setups = Respository().getSetups()
    }
}
