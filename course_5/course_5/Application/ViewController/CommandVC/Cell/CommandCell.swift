//
//  VoiceCell.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import UIKit

class CommandCell: BaseTableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var cellView: UIView!
    
    var onFavoriteChanged: ((Command) -> Void)? = nil
    
    private var command: Command!

    func configure(_ item: Command) {
        command = item
        titleLabel.text = item.text
        
        let imageName = item.isFavorited ? "ic_heart_red" : "ic_heart_gray"
        favoriteButton.setImage(UIImage(named: imageName), for: .normal)
    }
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        onFavoriteChanged?(command)
    }
    
}
