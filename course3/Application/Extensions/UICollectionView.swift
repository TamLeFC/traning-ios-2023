//
//  UICollectionView.swift
//  course3
//
//  Created by Tam Le on 03/07/2023.
//

import UIKit

extension UICollectionView {
    func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    func dequeueReuseable<T:BaseCollectionViewCell>(ofType type: T.Type, indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Couldn't find UICollectionView of class \(type.identifier)")
        }
        return cell
    }
}
