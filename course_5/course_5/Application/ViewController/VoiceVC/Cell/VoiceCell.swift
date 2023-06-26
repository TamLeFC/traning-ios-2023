//
//  VoiceCell.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import UIKit

class VoiceCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    private var isFavorite: Bool = false

    func configure(_ item: Command) {
        titleLabel.text = item.text
        
        let favoriteImage = item.isFavorated ? UIImage(named: "ic_hear_gray") : UIImage(named: "ic_hear_red")
        isFavorite = item.isFavorated
        favoriteButton.setImage(favoriteImage, for: .normal)
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        if isFavorite {
            favoriteButton.setImage(UIImage(named: "ic_heart_red"), for: .normal)
        }
        else {
            favoriteButton.setImage(UIImage(named: "ic_heart_gray"), for: .normal)
        }
        isFavorite.toggle()
        
    }
    
}
