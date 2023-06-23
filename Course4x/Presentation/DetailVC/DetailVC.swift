//
//  DetailVC.swift
//  Course4x
//
//  Created by KietKoy on 23/06/2023.
//

import UIKit

class DetailVC: UIViewController {
    
    var titleMovie:String = ""
    
    @IBOutlet weak var titleMovieLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleMovieLabel.text = titleMovie
    }

    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
