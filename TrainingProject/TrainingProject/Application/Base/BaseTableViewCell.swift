//
//  BaseTableViewCell.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    class var identifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
}
