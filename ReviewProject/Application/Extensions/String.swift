import UIKit

extension String {
    var toUIImage: UIImage? {
        
        return UIImage(named: self)
    }
    
    static func className(_ aClass: AnyClass) -> String {
        
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    func formatNumber(locale: Locale = .current, maximumFractionDigits: Int = 1) -> String {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = locale
        numberFormatter.numberStyle = .decimal
        numberFormatter.decimalSeparator = ","
        numberFormatter.maximumFractionDigits = maximumFractionDigits
        numberFormatter.minimumFractionDigits = 0
        
        guard let number = numberFormatter.number(from: self)?.doubleValue else {
            
            return self
        }
        
        let suffix: String
        let formattedNumber: Double
        
        switch number {
        case 0..<1_000:
            suffix = ""
            formattedNumber = number
        case 1_000..<1_000_000:
            suffix = "k"
            formattedNumber = number / 1_000
        case 1_000_000..<1_000_000_000:
            suffix = "m"
            formattedNumber = number / 1_000_000
        default:
            suffix = ""
            formattedNumber = number
        }
        
        let formattedString = numberFormatter.string(from: NSNumber(value: formattedNumber)) ?? self
        
        return formattedString + suffix
    }
    
}
