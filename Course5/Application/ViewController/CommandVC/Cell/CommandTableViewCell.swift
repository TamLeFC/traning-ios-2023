import UIKit

class CommandTableViewCell: BaseTableViewCell {

    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    var onFavoriteChanged: ((Command) -> Void)? = nil
    
    private var command: Command!
    
    func configure(_ item: Command) {
        itemLabel.text = item.text
        
        command = item
        
        favoriteImageView.isHighlighted = item.isFavorited
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containView.layer.cornerRadius = 16
    }
    
    @IBAction func onFavoriteTapped(_ sender: Any) {
        onFavoriteChanged?(command)
    }
}
