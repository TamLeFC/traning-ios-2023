//
//  AppDelegate.swift
//  course2
//
//  Created by Sơn Lê on 18/05/2023.
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
        
        window?.rootViewController = UINavigationController(rootViewController: MainVC.instantiate(viewModel: MainVM()))
        window?.makeKeyAndVisible()
    }
}
