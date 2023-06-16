//
//  ViewController.swift
//  Course1
//
//  Created by KietKoy on 16/06/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var retryButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        retryButton.layer.borderWidth = 1
        retryButton.layer.cornerRadius = 12
        retryButton.layer.borderColor = UIColor(named: "retryButton")?.cgColor
    }


}

