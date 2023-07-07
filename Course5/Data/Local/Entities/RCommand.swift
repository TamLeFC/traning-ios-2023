//
//  RCommand.swift
//  Course5
//
//  Created by KietKoy on 07/07/2023.
//

import Foundation
import RealmSwift
import Realm

class Rcommand: Object {
    @objc dynamic var text: String = ""
    
    override class func primaryKey() -> String? {
        return "text"
    }
}

extension Rcommand : ModelConvertibleType {
    var uid: String {
        return String(text)
    }
    
    func asModel() -> Command {
        return Command(text)
    }
}

extension Command: RealmRepresentable {
    typealias RealmType = Rcommand
    
    func asRealm() -> Rcommand {
        return Command.build{
            $0.text = text
        }
    }
}
