import RealmSwift
import Realm

class RCommand: Object {
    @objc dynamic var text: String = ""
    
    override class func primaryKey() -> String? {
        return "text"
    }
}

extension RCommand : ModelConvertibleType {
    var uid: String {
        return String(text)
    }
    
    func asModel() -> Command {
        return Command(text)
    }
}

extension Command: RealmRepresentable {
    typealias RealmType = RCommand
    
    func asRealm() -> RCommand {
        return Command.build {
            $0.text = text
        }
    }
}
