//
//  BaseCollectionViewCell.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    class var identifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
}
