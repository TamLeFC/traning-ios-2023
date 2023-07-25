import UIKit

class SettingTableViewCell: BaseTableViewCell {
    @IBOutlet dynamic weak var iconImageView: UIImageView!
    @IBOutlet dynamic weak var descriptionLabel: UILabel!
    
    func configure(_ item: SettingType) {
        
        iconImageView.image = item.icon.toUIImage
        descriptionLabel.text = item.description
    }
    
}
