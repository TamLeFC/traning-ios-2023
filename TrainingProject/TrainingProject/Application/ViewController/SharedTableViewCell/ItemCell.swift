//
//  ItemCell.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import UIKit
import Kingfisher

class ItemCell: BaseTableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var hotPriorityLabel: UILabel!
    @IBOutlet weak var downloadCountLabel: UILabel!
    @IBOutlet weak var moreLabel: UILabel!
    @IBOutlet weak var moreImageView: UIImageView!

    func configure(_ item: MineCraft) {
        configureUI()
        
        let url = URL(string: item.thumbURL)
        thumbnailImageView.kf.setImage(with: url)
        nameLabel.text = item.itemName
        authorNameLabel.text = item.authorName
        
        hotPriorityLabel.text = NumberFormatterHelper.formatNumber(item.hotPriority)
        downloadCountLabel.text = NumberFormatterHelper.formatNumber(item.downloadCount)
    }
    
    func configureUI() {
        cellView.layer.cornerRadius = 4
        
        thumbnailImageView.contentMode = .scaleAspectFill
        
        thumbnailImageView.layer.cornerRadius = 4
        thumbnailImageView.layer.maskedCorners = CACornerMask(arrayLiteral: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        
        nameLabel.font = UIFont(name: "Minecrafter", size: 16)
        authorNameLabel.font = UIFont(name: "SpaceGrotesk-Medium", size: 14)
        moreLabel.font = UIFont(name: "SpaceGrotesk-Regular", size: 14)
        moreImageView.contentMode = .scaleAspectFill
        moreImageView.clipsToBounds = false
        hotPriorityLabel.font = UIFont(name: "SpaceGrotesk-Medium", size: 14)
        downloadCountLabel.font = UIFont(name: "SpaceGrotesk-Bold", size: 14)

    }
    
    @IBAction private func moreButtontapped(_ sender: Any)
    {
        let alert = UIAlertController(title: "Feature is not available!", message: "This feature is currently unavailable but will be created soon.", preferredStyle: .alert)
        let alertActionOK = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(alertActionOK)
        window?.rootViewController?.present(alert, animated: true)
    }
}
