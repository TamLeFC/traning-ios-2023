//
//  SettingTableViewCell.swift
//  ReviewProject
//
//  Created by Mobile Dev 1 on 19/07/2023.
//

import UIKit

class SettingTableViewCell: BaseTableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(_ item: SettingType) {
        iconImageView.image = item.icon.toUIImage
        descriptionLabel.text = item.description
    }
}
