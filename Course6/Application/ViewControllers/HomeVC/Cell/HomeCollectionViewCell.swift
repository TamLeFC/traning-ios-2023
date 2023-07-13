import UIKit

class HomeCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func configure(_ item: Knot) {
        previewImageView.kf.setImage(with: URL(string: item.preview))
        titleLabel.text = item.title
        descriptionLabel.text = item.id
    }

}
