//
//  CategoryCell.swift
//  Course5
//
//  Created by KietKoy on 26/06/2023.
//

import UIKit

class CategoryCell: BaseCollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var containerIconView: GradientView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerIconView.addDropShadow(shadowRadius: 16, offset: CGSize(width: 0, height: 8), color: UIColor(hex: 0xA1AEB2, alpha: 0.2))
    }
    
    func configureCell(_ item: Category) {
        iconImageView.image = item.image.toUIImage
        textLabel.text = item.displayName
    }
}
