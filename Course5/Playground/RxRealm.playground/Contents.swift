import UIKit
import RxSwift
import RealmSwift
import RxRealm

class User: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var userid: Int = 0
}

let realm = try! Realm()
let users = realm.objects(User.self)

print("User Initially \(users.count)")

Observable.collection(from: users, synchronousStart: true, keyPaths: [], on: nil)
    .subscribe(onNext: {
        print("Change in the database \($0.count)")
    })
let user1 = User()
user1.name = "Tuan Kiet"

try! realm.write{
    realm.add(user1)
}

let user2 = User()
user2.name = "Anh Kiet"
user2.userid = 1

try! realm.write{
    realm.add(user2)
}
