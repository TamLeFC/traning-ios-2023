//
//  MediaCell.swift
//  Course6
//
//  Created by KietKoy on 13/07/2023.
//

import UIKit

class MediaCell: BaseCollectionViewCell {

    
    @IBOutlet weak var mediaImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(_ imagePath: String) {
        print("imagePath: \(imagePath)")
        loadImage(from: imagePath, into: mediaImageView)
    }
}
