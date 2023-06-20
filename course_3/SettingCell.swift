//
//  SettingCell.swift
//  course_3
//
//  Created by Mobile Dev on 20/06/2023.
//

import UIKit

class SettingCell: UITableViewCell {
    
    static let identifier = "SettingCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    @IBOutlet weak var iconRightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ item: SettingItem){
        iconImageView.image = UIImage(named: item.icon)
        titleLabel.text = item.title
        
        settingSwitch.isHidden = !item.isShowSwitch
        iconRightImageView.isHidden = item.isShowSwitch
        
    }
    
}
