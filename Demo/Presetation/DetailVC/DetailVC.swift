//
//  DetailVC.swift
//  Demo
//
//  Created by Tam Le on 23/06/2023.
//

import UIKit
import Cosmos

class DetailVC: UIViewController {
    
    @IBOutlet weak var comosView: CosmosView!
    
    var titleMovie: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        print(">>>>>>> \(navigationController?.description)")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
