//
//  ViewController.swift
//  Course4x
//
//  Created by KietKoy on 22/06/2023.
//

import UIKit

class MainVc: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let homeVC = HomeVC()
        let accountVC = AccountVC()
        
        homeVC.tabBarItem = UITabBarItem(title: nil, image: "ic_tv".toUIImage, selectedImage: "ic_tvSelected".toUIImage)
        
        accountVC.tabBarItem = UITabBarItem(title: nil, image: "ic_account".toUIImage, selectedImage: "ic_accountSelected".toUIImage)
        self.tabBar.barTintColor = UIColor(named: "background")
        self.tabBar.backgroundColor = UIColor(named: "background")
        viewControllers = [homeVC, accountVC]
    }
}

