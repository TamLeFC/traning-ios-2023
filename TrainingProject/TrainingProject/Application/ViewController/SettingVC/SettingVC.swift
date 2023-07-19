//
//  DetailVC.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var howToUseLabel: UILabel!
    @IBOutlet weak var premiumLabel: UILabel!
    @IBOutlet weak var privacyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImageView.layer.cornerRadius = 15
        avatarImageView.contentMode = .scaleAspectFit
        
        userNameLabel.font = UIFont(name: "space_grotesk_bold", size: 18)
        informationLabel.font = UIFont(name: "minecraft_regular", size: 16)
        passwordLabel.font = UIFont(name: "minecraft_regular", size: 16)
        notificationLabel.font = UIFont(name: "minecraft_regular", size: 16)
        howToUseLabel.font = UIFont(name: "minecraft_regular", size: 16)
        premiumLabel.font = UIFont(name: "minecraft_regular", size: 16)
        privacyLabel.font = UIFont(name: "minecraft_regular", size: 16)
    }


}
