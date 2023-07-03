//
//  GroupCell.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import UIKit

class GroupCell: BaseCollectionViewCell {

    @IBOutlet weak var groupCellImageView: UIImageView!
    
    func configure(_ item: Setup)
    {
        groupCellImageView.image = UIImage(named: item.icon)
        groupCellImageView.contentMode = .scaleAspectFill
    }

}
