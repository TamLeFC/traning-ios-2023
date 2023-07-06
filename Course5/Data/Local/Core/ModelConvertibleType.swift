import Realm
import RealmSwift

protocol ModelConvertibleType {
    associatedtype ModelType
    associatedtype KeyType
    
    var uid: KeyType { get }
    
    func asModel() -> ModelType
}

extension RealmRepresentable {
    static func build<O: Object>(_ builder: (O) -> Void) -> O {
        let object = O()
        builder(object)
        return object
    }
}
