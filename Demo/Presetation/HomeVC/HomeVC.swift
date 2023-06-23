//
//  HomeVC.swift
//  Demo
//
//  Created by Tam Le on 22/06/2023.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }


    @IBAction func movieButtonTapped(_ sender: Any) {
        let vc = DetailVC()
        vc.titleMovie = "Title movie"
//        navigationController?.pushViewController(vc, animated: true)
        present(vc, animated: true)
    }

}
