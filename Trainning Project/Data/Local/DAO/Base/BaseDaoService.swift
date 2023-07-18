//
//  BaseDAOService.swift
//  Trainning Project
//
//  Created by KietKoy on 18/07/2023.
//

import Foundation
import RealmSwift

protocol BaseDaoService {
    var realm: Realm { get }
    func writeObject(executeCode: () -> ())
}
