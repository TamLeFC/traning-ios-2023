//
//  AppDelegate.swift
//  Course6
//
//  Created by KietKoy on 13/07/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = UINavigationController(rootViewController: HomeVC.instantiate(viewModel: HomeVM()))
        window?.makeKeyAndVisible()
        return true
    }


}

