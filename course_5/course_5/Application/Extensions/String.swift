//
//  String.swift
//  course_5
//
//  Created by Mobile Dev on 06/07/2023.
//

import Foundation

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}
