//
//  CommandCell.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import UIKit

class CommandCell: UICollectionViewCell {

    @IBOutlet weak var commandCellView: GradientView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(_ item: Category)
    {
        imageView.image = UIImage(named: item.image)
        nameLabel.text = item.displayName
        nameLabel.font = UIFont(name: "Poppins-Medium", size: 12)
        commandCellView.layer.cornerRadius = 16
        commandCellView.borderColor = .white
        commandCellView.borderWidth = 2
    }

}
