import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UILabel.appearance().substituteFontName = "Poppins"
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainVC = MainVC()
        let navVC = UINavigationController(rootViewController: mainVC)
        
        navVC.isNavigationBarHidden = true
        
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()

        return true
    }
    
}

