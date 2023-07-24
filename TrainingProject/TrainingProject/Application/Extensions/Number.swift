//
//  Number.swift
//  TrainingProject
//
//  Created by Mobile Dev on 24/07/2023.
//

import Foundation

class NumberFormatterHelper {
    
    static func formatNumber(_ numberString: String) -> String {
        guard let numberInt = Int(numberString) else { return numberString }
        let value = numberInt >= 1000000 ? (Double(numberInt) / 1000000.0, "m") :
                    numberInt >= 1000 ? (Double(numberInt) / 1000.0, "k") : (Double(numberInt), "")
        let format = value.0.truncatingRemainder(dividingBy: 1) == 0 ? "%.0f%@" : "%.1f%@"
        return String(format: format, value.0, value.1)
    }
}
