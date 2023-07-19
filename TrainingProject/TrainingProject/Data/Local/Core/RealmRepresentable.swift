//
//  RealmRepresentable.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import Foundation

protocol RealmRepresentable {
    associatedtype RealmType: ModelConvertibleType
    
    func asRealm() -> RealmType
}
