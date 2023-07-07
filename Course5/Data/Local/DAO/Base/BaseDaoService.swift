//
//  BaseDaoService.swift
//  Course5
//
//  Created by KietKoy on 06/07/2023.
//

import Foundation
import RealmSwift

protocol BaseDaoService {
    var realm: Realm { get }
    func writeObject(executeCode: () -> ())
}
