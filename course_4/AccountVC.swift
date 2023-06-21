//
//  AccountVC.swift
//  course_4
//
//  Created by Mobile Dev on 21/06/2023.
//

import UIKit

class AccountVC: UIViewController {

    @IBOutlet weak var accountView: GradientView!
    @IBOutlet weak var accountImageView: UIImageView!
    @IBOutlet weak var premiumView: GradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accountView.layer.cornerRadius = 33
        premiumView.layer.cornerRadius = 8
        
        accountImageView.translatesAutoresizingMaskIntoConstraints = false
        accountImageView.contentMode = .scaleToFill

    }
    

}
