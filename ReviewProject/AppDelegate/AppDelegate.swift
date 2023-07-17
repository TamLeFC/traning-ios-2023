import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configWindow()
        
        return true
    }

}

extension AppDelegate {
    private func configWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainVC = MainVC.instantiate(viewModel: BaseVM())
        let navVC = UINavigationController(rootViewController: mainVC)
        
        navVC.isNavigationBarHidden = true
        
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
}
