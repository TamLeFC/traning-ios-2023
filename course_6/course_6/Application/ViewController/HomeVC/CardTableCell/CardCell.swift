//
//  CardCell.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import UIKit
import Kingfisher

class CardCell: BaseTableViewCell {

    @IBOutlet weak var cardCellView: UIView!
    @IBOutlet weak var knotImageView: UIImageView!
    @IBOutlet weak var knotNameLabel: UILabel!

    func configure(_ item: Knot) {
        
        cardCellView.layer.cornerRadius = 8
        knotNameLabel.font = UIFont(name: "Roboto-Bold", size: 20)
        knotImageView.contentMode = .scaleAspectFit
        
        if let url = URL(string: item.preview) {
                    knotImageView.kf.setImage(with: url)
                }
        knotNameLabel.text = item.title
    }
}
