//
//  String.swift
//  course3
//
//  Created by Tam Le on 03/07/2023.
//

import Foundation

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}
