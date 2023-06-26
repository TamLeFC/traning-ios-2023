//
//  ViewController.swift
//  course_4y
//
//  Created by Mobile Dev on 23/06/2023.
//

import UIKit

class MainVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setuptabBar()
        
    }
    
    private func setuptabBar()
    {
        let homeVC = HomeVC()
        let accountVC = AccountVC()
        
        homeVC.tabBarItem = UITabBarItem(title: "", image: "ic_home".toUIImage, selectedImage: "ic_home_selected".toUIImage)
        accountVC.tabBarItem = UITabBarItem(title: "", image: "ic_account".toUIImage, selectedImage: "ic_account_selected".toUIImage)
        tabBar.backgroundColor = UIColor(named: "color_bg")
        viewControllers = [homeVC, accountVC]
    }


}

