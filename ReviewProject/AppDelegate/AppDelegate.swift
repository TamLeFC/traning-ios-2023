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
        
        if #available(iOS 13.0, *) {
                window = UIApplication.shared.windows.first

                let topPadding = window?.safeAreaInsets.top

                let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: topPadding ?? 0.0))

                statusBar.backgroundColor = UIColor(named: "AppPrimaryColor")

                UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.addSubview(statusBar)

        }
        
        navVC.isNavigationBarHidden = true
        
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
}
