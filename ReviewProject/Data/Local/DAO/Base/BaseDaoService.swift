import RealmSwift

protocol BaseDaoService {
    var realm: Realm { get }
    
    func writeObject(executeCode: () -> ())
    
}
