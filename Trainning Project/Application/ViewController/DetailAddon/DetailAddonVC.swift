//
//  DetailAddon.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import UIKit

class DetailAddonVC: BaseVC<DetailAddonVM> {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var favoriteView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }
    
    override func initViews() {
        super.initViews()
        
        stackView.addTopBorder(with: UIColor(hex: 0x1E1F21), andWidth: 1)
        
        favoriteView.addRightBorder(with: UIColor(hex: 0x979797), andWidth: 1)
    }


    @IBAction func backButtonTouched(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
