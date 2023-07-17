//
//  UITextField.swift
//  Course4x
//
//  Created by KietKoy on 22/06/2023.
//

import UIKit
extension UITextField {
    func setLeftView(image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 18, y: 12, width: 24, height: 24)) 
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 48))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
        self.tintColor = .lightGray
    }
    
    func addPaddingToTextField(_ oriented: Oriented, width: Double) {
        let paddingView:UIView
        switch oriented {
        case .left:
            paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 0))
            self.leftView = paddingView
            self.leftViewMode = .always
        case .right:
            paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 0))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}

enum Oriented {
    case left
    case right
}
