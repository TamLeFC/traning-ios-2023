//
//  DetailVC.swift
//  TrainingProject
//
//  Created by Mobile Dev on 18/07/2023.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var addonDetailView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var nameAuthorLabel: UILabel!
    @IBOutlet weak var hotLabel: UILabel!
    @IBOutlet weak var downloadCountLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var favoriteView: UIView!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var contentInformationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        addonDetailView.layer.cornerRadius = 8
        
        favoriteImageView.contentMode = .scaleToFill
        favoriteImageView.clipsToBounds = true

        nameLabel.font = UIFont(name: "minecrafter_reg", size: 16)
        authorLabel.font = UIFont(name: "space_grotesk_regular", size: 16)
        nameAuthorLabel.font = UIFont(name: "space_grotesk_medium", size: 16)
        hotLabel.font = UIFont(name: "space_grotesk_medium", size: 14)
        downloadCountLabel.font = UIFont(name: "space_grotesk_bold", size: 14)
        favoriteLabel.font = UIFont(name: "space_grotesk_bold", size: 18)
        informationLabel.font = UIFont(name: "space_grotesk_bold", size: 18)
        contentInformationLabel.font = UIFont(name: "space_grotesk_regular", size: 18)
        
        
        
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}
	
