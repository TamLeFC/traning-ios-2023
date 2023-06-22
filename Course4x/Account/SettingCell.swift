//
//  SettingCell.swift
//  Course4x
//
//  Created by KietKoy on 22/06/2023.
//

import UIKit

class SettingCell: UITableViewCell {

    static let identifier = "SettingCell"
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(_ item: SettingItem) {
        icon.image = UIImage(named: item.icon)
        label.text = item.text
    }
}
