import UIKit

class CommandTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    func configure(_ item: Command) {
        itemLabel.text = item.text
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 16
    }
    
    
    @IBAction func onFavoriteTapped(_ sender: Any) {
        favoriteImageView.isHighlighted = !favoriteImageView.isHighlighted
    }
}
