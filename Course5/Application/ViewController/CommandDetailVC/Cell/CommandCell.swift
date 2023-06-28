//
//  CommandCell.swift
//  Course5
//
//  Created by KietKoy on 28/06/2023.
//

import UIKit

class CommandCell: UITableViewCell {

    static let identifier = "CommandCell"
    
    @IBOutlet weak var commandLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ item: Command) {
        commandLabel.text = item.text
    }
}
