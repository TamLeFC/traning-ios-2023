import UIKit

class MainVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        
        let moviesTVVC = MoviesTVVC()
        let accountVC = AccountVC()

        moviesTVVC.tabBarItem = UITabBarItem(title: nil, image: "ic_movies_tv".toUIImage, selectedImage: "ic_movies_tv".toUIImage)

        accountVC.tabBarItem = UITabBarItem(title: nil, image: "ic_account_tab".toUIImage, selectedImage: "ic_account_tab".toUIImage)

        viewControllers = [moviesTVVC, accountVC]
        
        tabBar.backgroundImage = UIImage()
        tabBar.tintColor = UIColor(named: "color_tab_bar_selected")
        tabBar.unselectedItemTintColor = UIColor(named: "color_tab_bar_unselected")
    }
}
