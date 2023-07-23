import UIKit
import Kingfisher

class ListAddonCollectionViewCell: BaseCollectionViewCell {
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var invertedButton: InvertedCornerView!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var commentCount: UILabel!
    
    func configure(_ item: Addon) {
        thumbImageView.kf.setImage(with: URL(string: item.thumbUrl.trimmingCharacters(in: .whitespacesAndNewlines)), placeholder: "image_thumb_default".toUIImage)
        itemNameLabel.text = item.itemName
        authorNameLabel.text = item.authorName
        likeCount.text = item.hotPriority.formatNumber()
        commentCount.text = item.downloadCount.formatNumber()
        
        invertedButton.addDropShadow(shadowRadius: 6, offset: .init(width: 2, height: 4), color: .black.withAlphaComponent(0.5))
    }
}
