//
//  AddonCell.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import UIKit

class AddonCell: BaseCollectionViewCell {

    @IBOutlet weak var thumbImage: UIImageView!
    
    @IBOutlet weak var itemNameLable: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var favoriteCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var favoriteView: UIView!
    
    @IBOutlet weak var moreButton: UIView!
    
    var onMoreButtonTouched: ((Addon) -> Void)? = nil
    private var addon: Addon!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initViews()
    }
    
    private func initViews() {
        favoriteView.addRightBorder(with: UIColor(hex: 0x979797), andWidth: 1.0)
        
        stackView.addTopBorder(with: UIColor(hex: 0x1E1F21), andWidth: 1.0)
        
        moreButton.addDropShadow(shadowRadius: 6,
                                 offset: CGSize(width: 2, height: 4),
                                 color: UIColor(hex: 0x000000, alpha: 0.5))
    }
    
    public func configureCell(_ item: Addon) {
        self.addon = item
        
        configureCellUI(with: item)
    }
    
    @IBAction func onmoreButtonTouched(_ sender: UIButton) {
        onMoreButtonTouched?(addon)
    }
}

extension AddonCell {
    private func configureCellUI(with addon: Addon) {
        loadImage(from: addon.thumbUrl, into: thumbImage)
        itemNameLable.text = addon.itemName
        authorLabel.text = addon.authorName
        favoriteCountLabel.text = "\(addon.hotPriority)k"
        commentCountLabel.text = "\(addon.downloadCount)k"
    }
}
