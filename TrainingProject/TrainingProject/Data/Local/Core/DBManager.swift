//
//  DBManager.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import Foundation
import Realm
import RealmSwift

private let dbVersion : UInt64 = 1
private let dbName = "training_project"

final class DBManager {
    
    final class func shared() -> DBManager {
        return shareInstance
    }
    
    private static var shareInstance: DBManager = {
        let dbManager = DBManager()
        return dbManager
    }()
    
    var config: Realm.Configuration!
    
    init() {
        
        config = Realm.Configuration(
            schemaVersion: dbVersion,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 1 {
                    //MARK: migrate db here
                }
            }
        )
        Realm.Configuration.defaultConfiguration = config
    }
}
