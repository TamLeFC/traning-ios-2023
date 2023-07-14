//
//  AppDelegate.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configWindow()
        return true
    }
    
    
}

extension AppDelegate {
    
    private func configWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = UINavigationController(rootViewController: HomeVC.instantiate(viewModel: HomeVM()))
        
        window?.makeKeyAndVisible()
    }
}
