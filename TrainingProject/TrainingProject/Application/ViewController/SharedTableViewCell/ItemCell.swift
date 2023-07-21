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
    @IBOutlet weak var moreButton: UIButton!

    func configure(_ item: MineCraft) {
        moreButton.imageView?.contentMode = .scaleAspectFill
        cellView.layer.cornerRadius = 4
        
        thumbnailImageView.contentMode = .scaleAspectFill
        
        thumbnailImageView.layer.cornerRadius = 4
        thumbnailImageView.layer.maskedCorners = CACornerMask(arrayLiteral: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        
        let url = URL(string: item.thumbURL)
        thumbnailImageView.kf.setImage(with: url)
        nameLabel.text = item.itemName
        authorNameLabel.text = item.authorName
        hotPriorityLabel.text = item.hotPriority
        downloadCountLabel.text = item.downloadCount
    }

}
