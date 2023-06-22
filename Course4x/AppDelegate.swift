//
//  AppDelegate.swift
//  Course4x
//
//  Created by KietKoy on 22/06/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        window = UIWindow(frame: UIScreen.main.bounds)
//
//        let mainVC = MainVc()
//        let nvc = UINavigationController(rootViewController: mainVC)
//        window?.rootViewController = nvc
//        window?.makeKeyAndVisible()
//        return true
        
        
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainVC = MainVc()
        let nvc = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
        return true
    }


}

