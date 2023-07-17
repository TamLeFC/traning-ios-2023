import UIKit

class HomeCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func configure(_ item: Addon) {
        previewImageView.kf.setImage(with: URL(string: item.itemName))
        titleLabel.text = item.typeId
        descriptionLabel.text = item.itemId
    }

}
