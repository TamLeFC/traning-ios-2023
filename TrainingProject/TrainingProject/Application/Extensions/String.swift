//
//  String.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import Foundation

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}
