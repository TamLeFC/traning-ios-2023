//
//  SectionHeaderView.swift
//  Trainning Project
//
//  Created by KietKoy on 18/07/2023.
//
import UIKit

class SectionHeaderView: UICollectionReusableView {
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        // Cấu hình giao diện của Section Header, bao gồm việc thêm bottom border
        let bottomBorder = UIView(frame: CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1))
        bottomBorder.backgroundColor = UIColor.red // Màu đường viền
        self.addSubview(bottomBorder)
    }
    
    class var identifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

