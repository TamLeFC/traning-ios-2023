//
//  CommandCell.swift
//  Course5
//
//  Created by KietKoy on 28/06/2023.
//

import UIKit

class CommandCell: BaseTableViewCell {
    
    @IBOutlet weak var commandLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    var onFavoriteChanged: ((Command) -> Void)? = nil
    private var command: Command!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ item: Command) {
        self.command = item
        commandLabel.text = item.text
        
        favoriteImageView.image = item.isFavorite ? "ic_heart_favorite".toUIImage : "ic_heart".toUIImage
    }
    
    
    @IBAction func favoriteButtonTouched(_ sender: UIButton) {
        onFavoriteChanged?(command)
    }
}
