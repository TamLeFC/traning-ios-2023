import RealmSwift
import Realm

class RAddon: Object {
    @objc dynamic var itemId: String = ""
    
    override class func primaryKey() -> String? {
        
        return "itemId"
    }
    
}

extension RAddon : ModelConvertibleType {
    var uid: String {
        
        return String(itemId)
    }
    
    func asModel() -> Addon {
        
        return Addon(itemId)
    }
    
}

extension Addon: RealmRepresentable {
    typealias RealmType = RAddon
    
    init(_ itemId: String) {
        
        self.itemId = itemId
    }
    
    func asRealm() -> RAddon {
        
        return Addon.build {
            $0.itemId = itemId
        }
    }
    
}
