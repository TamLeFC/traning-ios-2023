//
//  AppDelegate.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        config()
        return true
    }
}

extension AppDelegate {
    private func config() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let nvc = UINavigationController(rootViewController: MainVC())
        nvc.navigationBar.isHidden = true
        
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
        
    }
}

