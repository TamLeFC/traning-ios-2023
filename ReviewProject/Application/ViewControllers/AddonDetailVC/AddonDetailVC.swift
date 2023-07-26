import UIKit
import RxDataSources
import Kingfisher

class AddonDetailVC: BaseVC<AddonDetailVM> {
    @IBOutlet dynamic weak var scrollView: UIScrollView!
    @IBOutlet dynamic weak var contentFavoriteButtonLabel: UILabel!
    @IBOutlet dynamic weak var descriptionLabel: UILabel!
    @IBOutlet dynamic weak var commentCountLabel: UILabel!
    @IBOutlet dynamic weak var likeCountLabel: UILabel!
    @IBOutlet dynamic weak var authorNameLabel: UILabel!
    @IBOutlet dynamic weak var itemNameLabel: UILabel!
    @IBOutlet dynamic weak var imageView: UIImageView!
    
    private let subView = UIView()
    
    @IBAction dynamic func onBackButtonTapped(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction dynamic func onSetFavoriteButtonTapped(_ sender: Any) {
        
        viewModel.favoriteChanged()
    }
    
    override func initViews() {
        
        super.initViews()
        scrollView.addSubview(subView)
    }
    
    override func bindViewModel() {
        
        super.bindViewModel()
        
        viewModel.addonS.subscribe { [weak self] addon in
            
            guard let self = self,
                  let element = addon.element else { return }
            
            bindAddonData(element)
        }.disposed(by: bag)
        
        viewModel.fetchData()
    }
    
}

extension AddonDetailVC {
    
    private func bindAddonData(_ element: Addon) {
        
        self.imageView.kf.setImage(with: URL(string: element.imageUrl.trimmingCharacters(in: .whitespacesAndNewlines)),
                                   placeholder: "image_thumb_default".toUIImage)
        self.itemNameLabel.text = element.itemName
        self.authorNameLabel.text = "Author: \(element.authorName)"
        self.likeCountLabel.text = element.hotPriority.formatNumber()
        self.commentCountLabel.text = element.downloadCount.formatNumber()
        self.descriptionLabel.text = element.description.isEmpty ? element.shortDescription : element.description
        
        if (!element.isFavorited) {
            
            setContentFavoriteButton(text: "Add to favorite", hexColor: 0xFFB31A)
        }
        else {
            
            setContentFavoriteButton(text: "Remove from favorite", hexColor: 0xFF431A)
        }
    }
    
    private func setContentFavoriteButton(text: String, hexColor: Int) {
        
        self.contentFavoriteButtonLabel.text = text
        self.contentFavoriteButtonLabel.textColor = UIColor.init(hex: hexColor)
    }
    
}
