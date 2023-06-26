//
//  AppDelegate.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        windowMainConfig()
        return true
    }
}

extension AppDelegate {
    private func windowMainConfig() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = UINavigationController(rootViewController: MainVC())
        window?.makeKeyAndVisible()
    }
}

