import UIKit

class SetupCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var setupItemImageView: UIImageView!
    
    func configure(_ item: Setup) {
        setupItemImageView.image = UIImage(named: item.icon) ?? UIImage(named: "banner_shopping_list")
    }

}
