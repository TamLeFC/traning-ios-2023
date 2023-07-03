import UIKit
import RealmSwift
class Person: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    let dogs = List<Dog>()
    override class func primaryKey() -> String? {
        return "id"
    }
}
class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var owner: Person?
}
