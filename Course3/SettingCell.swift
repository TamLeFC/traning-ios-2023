import UIKit

class SettingCell: UITableViewCell {
    
    static let identifier = "SettingCell"

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nextImageView: UIImageView!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(item: SettingItem) {
        
        iconImageView.image = UIImage(named: item.icon)
        
        titleLabel.text = item.title
        
        nextImageView.isHidden = item.isShowSwitch
        settingSwitch.isHidden = !item.isShowSwitch
    }
}
