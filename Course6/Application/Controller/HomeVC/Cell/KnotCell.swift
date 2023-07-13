//
//  FlowerCell.swift
//  Course6
//
//  Created by KietKoy on 13/07/2023.
//

import UIKit
import Kingfisher

class KnotCell: BaseCollectionViewCell {

    
    @IBOutlet weak var knotImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(_ item: Knot) {
        nameLabel.text = item.title
        descriptionLabel.text = item.id
        
        loadImage(from: item.preview, into: knotImageView)
    }
}
