import Realm
import RealmSwift

private let dbVersion : UInt64 = 1
private let dbName = "base_project"

final class DBManager {
    
    final class func shared() -> DBManager {
        
        return sharedInstance
    }
    
    private static var sharedInstance: DBManager = {
        
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
