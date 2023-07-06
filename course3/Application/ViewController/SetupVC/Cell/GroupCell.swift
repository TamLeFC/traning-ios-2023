//
//  GroupCell.swift
//  course2
//
//  Created by Sơn Lê on 21/05/2023.
//

import UIKit

class GroupCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!

    func configure(_ item: Setup) {
        imageView.image = UIImage(named: item.icon)
    }

}
