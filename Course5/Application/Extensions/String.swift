//
//  String.swift
//  Course4x
//
//  Created by KietKoy on 22/06/2023.
//

import UIKit
extension String {
    var toUIImage: UIImage? {
        return UIImage(named: self)
    }
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}
