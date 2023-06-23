//
//  ViewController.swift
//  Demo
//
//  Created by Tam Le on 21/06/2023.
//

import UIKit

class MainVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }

    private func setupTabBar() {
        let homeVC = HomeVC()
        let accountVC = AccountVC()

        homeVC.tabBarItem = UITabBarItem(title: "Home", image: "ic_artist".toUIImage, selectedImage: "ic_artist_selected".toUIImage)

        accountVC.tabBarItem = UITabBarItem(title: "Account", image: "ic_gear".toUIImage, selectedImage: "ic_gear_selected".toUIImage)

        viewControllers = [homeVC, accountVC]
    }
}

