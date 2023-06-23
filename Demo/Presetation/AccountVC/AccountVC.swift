//
//  AccountVC.swift
//  Demo
//
//  Created by Tam Le on 22/06/2023.
//

import UIKit

class AccountVC: UIViewController {

    @IBOutlet weak var shadowView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green

        
        shadowView.addDropShadow(
            shadowRadius: 8,
            offset: CGSize(width: 0, height: 4),
            color: UIColor(hex: 0xFF7C1A, alpha: 0.3)
        )
        
        
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
