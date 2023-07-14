//
//  UITabelView.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import UIKit

extension UITableView {
    
    func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func dequeueReuseable<T:BaseTableViewCell>(ofType type: T.Type, indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Couldn't find UITableViewCell of class \(type.identifier)")
        }
        return cell
    }
    
}
