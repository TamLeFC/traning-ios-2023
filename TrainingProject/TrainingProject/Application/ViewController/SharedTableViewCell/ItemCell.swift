//
//  ItemCell.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var moreButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        moreButton.imageView?.contentMode = .scaleAspectFill
        cellView.layer.cornerRadius = 4
    }


    
}
