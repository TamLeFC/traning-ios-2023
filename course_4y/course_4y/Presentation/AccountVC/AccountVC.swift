//
//  AccountVC.swift
//  course_4y
//
//  Created by Mobile Dev on 23/06/2023.
//

import UIKit

class AccountVC: UIViewController {

    @IBOutlet weak var accountView: GradientView!
    @IBOutlet weak var accountImageView: UIImageView!
    @IBOutlet weak var premiumView: GradientView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        accountImageView.contentMode = .scaleToFill
        
        accountView.layer.cornerRadius = 35
        
        premiumView.layer.cornerRadius = 8
    }
}
