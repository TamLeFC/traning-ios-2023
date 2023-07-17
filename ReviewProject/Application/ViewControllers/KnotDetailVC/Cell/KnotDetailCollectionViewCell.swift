//
//  KnotDetailCollectionViewCell.swift
//  Course6
//
//  Created by Mobile Dev 1 on 14/07/2023.
//

import UIKit

class KnotDetailCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var newMediaImageView: UIImageView!
    
    func configure(_ item: String) {
        newMediaImageView.kf.setImage(with: URL(string: item))
    }
    
}
