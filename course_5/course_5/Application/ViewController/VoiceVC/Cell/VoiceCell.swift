//
//  VoiceCell.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import UIKit

class VoiceCell: BaseTableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var cellView: UIView!
    
    private var isFavorite: Bool = false

    func configure(_ item: Command) {
        titleLabel.text = item.text
        
        favoriteButton.setImage(UIImage(named: "ic_heart_gray"), for: .normal)
    }
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        isFavorite.toggle()
        updateFavoriteButtonImage()
    }
    
    private func updateFavoriteButtonImage() {
        let imageName = isFavorite ? "ic_heart_red" : "ic_heart_gray"
        favoriteButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
}
