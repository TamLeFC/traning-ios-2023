//
//  CommandCell.swift
//  course2
//
//  Created by Sơn Lê on 21/05/2023.
//

import UIKit

class CommandCell: BaseTableViewCell {

    @IBOutlet weak var mainView: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var onFavoriteChanged: ((Command) -> Void)? = nil
    
    private var command: Command!
    
    func configure(_ item: Command) {
        command = item
        
        titleLabel.text = item.text
        
        let favoriteImage = item.isFavorated ? UIImage(named: "ic_heart_red") : UIImage(named: "ic_heart_gray")
        favoriteButton.setImage(favoriteImage, for: .normal)
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        onFavoriteChanged?(command)
    }
}
