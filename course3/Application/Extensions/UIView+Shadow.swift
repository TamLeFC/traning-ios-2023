//
//  UIView+Shadow.swift
//  Course2-Alexa
//
//  Created by Tam Le on 17/05/2023.
//

import UIKit

extension UIView {
    func addDropShadow(
            shadowRadius: CGFloat = 0,
            offset: CGSize = CGSize(width: 0, height: 0),
            color: UIColor = UIColor.black
        ) {
            layer.masksToBounds = false
            layer.shadowColor = color.cgColor
            layer.shadowOffset = offset
            layer.shadowOpacity = 1
            layer.shadowRadius = shadowRadius
        }
}
