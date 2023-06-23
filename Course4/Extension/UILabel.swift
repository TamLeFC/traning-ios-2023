import UIKit

extension UILabel {
    
    @objc var substituteFontName : String {
        get { return self.font.fontName }
        set {
            if self.font.fontName.range(of:"Light") != nil {
                self.font = UIFont(name: "\(newValue)-Light", size: self.font.pointSize)
            }
            if self.font.fontName.range(of:"Regular") != nil {
                self.font = UIFont(name: "\(newValue)-Regular", size: self.font.pointSize)
            }
            if self.font.fontName.range(of:"Medium") != nil {
                self.font = UIFont(name: "\(newValue)-Medium", size: self.font.pointSize)
            }
            if self.font.fontName.range(of:"Bold") != nil {
                self.font = UIFont(name: "\(newValue)-Bold", size: self.font.pointSize)
            }
        }
    }
}
