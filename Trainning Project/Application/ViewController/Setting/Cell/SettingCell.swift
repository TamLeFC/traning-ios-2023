//
//  SettingCell.swift
//  Trainning Project
//
//  Created by KietKoy on 18/07/2023.
//

import UIKit

class SettingCell: BaseTableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleSettingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ item: SettingItem) {
        iconImageView.image = item.icon.toUIImage
        
        titleSettingLabel.text = item.text
    }
    
}
