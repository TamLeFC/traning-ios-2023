//
//  AppDelegate.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = UINavigationController(rootViewController: MainVC())
        window?.makeKeyAndVisible()
        
        return true
    }

}

