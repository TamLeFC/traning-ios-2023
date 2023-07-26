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
        avatarImageView.contentMode = .center
        
        userNameLabel.font = UIFont(name: "SpaceGrotesk-Bold", size: 18)
        informationLabel.font = UIFont(name: "Minecraft-Regular", size: 16)
        passwordLabel.font = UIFont(name: "Minecraft-Regular", size: 16)
        notificationLabel.font = UIFont(name: "Minecraft-Regular", size: 16)
        howToUseLabel.font = UIFont(name: "Minecraft-Regular", size: 16)
        premiumLabel.font = UIFont(name: "Minecraft-Regular", size: 16)
        privacyLabel.font = UIFont(name: "Minecraft-Regular", size: 16)
    }

    @IBAction private func buttonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Feature is not available!", message: "This feature is currently unavailable but will be created soon.", preferredStyle: .alert)
        let alertActionOK = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(alertActionOK)
        self.present(alert, animated: true, completion: nil)
    }
}
