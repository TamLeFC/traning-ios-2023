//
//  MainVC.swift
//  course3
//
//  Created by Tam Le on 12/07/2023.
//

import UIKit

class MainVC: BaseVC<MainVM> {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.trigger.accept(())
    }

}
