//
//  AccountController.swift
//  learn
//
//  Created by Foxcode on 15/05/2023.
//

import UIKit

class AccountController: UIViewController {
    @IBOutlet weak var gradientButtonView: GradientView!
    @IBOutlet weak var goPremiumButton: UIButton!
    @IBOutlet weak var avatarImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.clipsToBounds = true

        gradientButtonView.layer.cornerRadius = 8
        gradientButtonView.clipsToBounds = true
    }
 }
