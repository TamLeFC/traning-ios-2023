//
//  HomeCollectionViewCell.swift
//  Course5
//
//  Created by Mobile Dev 1 on 26/06/2023.
//

import UIKit

class HomeCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupBackground()
    }
    
    private func setupBackground() {
        gradientView.layer.cornerRadius = 16
        gradientView.layer.borderWidth = 2
        gradientView.layer.borderColor = UIColor(named: "color_gradient_stroke")?.cgColor
        gradientView.layer.shadowColor = UIColor(named: "color_category_shadow")?.cgColor
        gradientView.layer.shadowOpacity = 0.2
        gradientView.layer.shadowOffset = CGSize(width: 0, height: 8)
        gradientView.layer.shadowRadius = 8
    }
    
    func configure(_ item: Category) {
        imageView.image = UIImage(named: item.image) ?? UIImage(named: "ic_heart")
        itemLabel.text = item.displayName
    }
}
