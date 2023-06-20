//
//  SettingCell.swift
//  Course3
//
//  Created by KietKoy on 20/06/2023.
//

import UIKit

class SettingCell: UITableViewCell {

    static let identifier = "SettingCell"
    @IBOutlet weak var iconSetting: UIImageView!
    @IBOutlet weak var iconBack: UIImageView!
    @IBOutlet weak var labelSetting: UILabel!
    @IBOutlet weak var switchSetting: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(_ item: SettingItem) {
        iconSetting.image = UIImage(named: item.icon)
        labelSetting.text = item.title
        iconBack.isHidden = item.isShowSwitch
        switchSetting.isHidden = !item.isShowSwitch
    }
}
