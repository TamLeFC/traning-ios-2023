//
//  SetupCell.swift
//  Course5
//
//  Created by KietKoy on 27/06/2023.
//

import UIKit

class SetupCell: UICollectionViewCell {
    static let identifier = "SetupCell"

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(_ item: Setup) {
        backgroundImageView.image = item.background.toUIImage
        iconImageView.image = item.icon.toUIImage
        textLabel.text = item.title
    }
}
