//
//  Color.swift
//  TrainingProject
//
//  Created by Mobile Dev on 24/07/2023.
//

import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let v = hex.map { String($0) } + Array(repeating: "0", count: max(6 - hex.count, 0))
        let hex = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
        let red = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
        let green = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
        self.init(red: red, green: green, blue: hex, alpha: alpha)
    }
}
