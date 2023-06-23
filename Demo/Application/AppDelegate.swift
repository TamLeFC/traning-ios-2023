//
//  AppDelegate.swift
//  Demo
//
//  Created by Tam Le on 21/06/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainVC = MainVC()
        let nvc = UINavigationController(rootViewController: mainVC)
        nvc.navigationBar.isHidden = true
        
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
        
        return true
    }

}

