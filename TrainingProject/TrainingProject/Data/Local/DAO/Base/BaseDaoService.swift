//
//  BaseDaoService.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import Foundation
import RealmSwift

protocol BaseDaoService {
    var realm: Realm { get }
    func writeObject(executeCode: () -> ())
}
