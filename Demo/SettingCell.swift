//
//  SettingCell.swift
//  Demo
//
//  Created by Tam Le on 20/06/2023.
//

import UIKit

class SettingCell: UITableViewCell {
    
    static let identifier = "SettingCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var settingSwitch: UISwitch!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ item: SettingItem) {
        label.text = item.title
        
        iconImageView.isHidden = item.isShowSwitch
        settingSwitch.isHidden = !item.isShowSwitch
    }
}
