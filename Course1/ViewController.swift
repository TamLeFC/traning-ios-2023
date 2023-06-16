//
//  ViewController.swift
//  IOSTraning
//
//  Created by Mobile Dev 1 on 16/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var retryBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        retryBtn.layer.cornerRadius = 12
        retryBtn.layer.borderWidth = 1
        retryBtn.layer.borderColor = UIColor(named: "btnNotFondColor")?.cgColor
    }
}

