import UIKit
let userdefault = UserDefaults.standard
userdefault.set("Tuan Kiet", forKey: "name")
print(userdefault.string(forKey: "name")!)
