//
//  ViewController.swift
//  course_1
//
//  Created by Mobile Dev on 16/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var RetryBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        RetryBtn.layer.cornerRadius = 12
        RetryBtn.layer.borderWidth = 1
        RetryBtn.layer.borderColor = UIColor(named: "primary_color")?.cgColor
        RetryBtn.titleLabel?.textColor = UIColor(named: "primary_color")
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }

}

