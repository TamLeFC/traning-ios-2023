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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configureCell(_ item: SettingItem) {
        iconImageView.image     = item.icon.toUIImage
        
        titleSettingLabel.text  = item.text
    }
    
}
