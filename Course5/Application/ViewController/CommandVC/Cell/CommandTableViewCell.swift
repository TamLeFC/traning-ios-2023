import UIKit

class CommandTableViewCell: BaseTableViewCell {

    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    func configure(_ item: Command) {
        itemLabel.text = item.text
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containView.layer.cornerRadius = 16
    }
    
    @IBAction func onFavoriteTapped(_ sender: Any) {
        favoriteImageView.isHighlighted = !favoriteImageView.isHighlighted
    }
}
