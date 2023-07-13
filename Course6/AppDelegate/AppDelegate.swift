import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configWindow()
        configFont()
        
        return true
    }

}

extension AppDelegate {
    private func configWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainVC = HomeVC.instantiate(viewModel: HomeVM())
        let navVC = UINavigationController(rootViewController: mainVC)
        
        navVC.isNavigationBarHidden = true
        
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
    
    private func configFont() {
        UILabel.appearance().substituteFontName = "Roboto"
    }
}
