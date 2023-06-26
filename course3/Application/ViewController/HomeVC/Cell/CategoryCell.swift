//
//  CategoryCell.swift
//  course2
//
//  Created by Sơn Lê on 19/05/2023.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    func configure(_ item: Category) {
        imageView.image = UIImage(named: item.image)
        titleLabel.text = item.displayName
    }

}
