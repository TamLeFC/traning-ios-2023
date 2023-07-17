import UIKit

extension String {
    var toUIImage: UIImage? {
        return UIImage(named: self)
    }
    
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}
