//
//  CommandCell.swift
//  course2
//
//  Created by Sơn Lê on 21/05/2023.
//

import UIKit

class CommandCell: UITableViewCell {

    @IBOutlet weak var mainView: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    func configure(_ item: Command) {
        titleLabel.text = item.text
        
        let favoriteImage = item.isFavorated ? UIImage(named: "ic_hear_gray") : UIImage(named: "ic_hear_red")
        favoriteButton.setImage(favoriteImage, for: .normal)
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
    }
}
