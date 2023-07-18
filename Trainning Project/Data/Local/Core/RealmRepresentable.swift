//
//  File.swift
//  Trainning Project
//
//  Created by KietKoy on 18/07/2023.
//

import Foundation

protocol RealmRepresentable {
    associatedtype RealmType: ModelConvertibleType
    
    func asRealm() -> RealmType
}
