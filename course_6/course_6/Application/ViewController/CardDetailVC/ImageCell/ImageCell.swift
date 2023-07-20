//
//  ImageCell.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import UIKit
import Kingfisher

class ImageCell: BaseCollectionViewCell {
    
    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var mediaImageview: UIImageView!
    
    func configure(_ item: String) {
        mediaImageview.contentMode = .scaleAspectFill
        mediaView.layer.cornerRadius = 8
        
        if let url = URL(string: item) {
            mediaImageview.kf.setImage(with: url)
        }
        
    }
}
