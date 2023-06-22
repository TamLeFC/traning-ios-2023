import UIKit

class ViewController: UITabBarController {
    
    @IBOutlet weak var tabBarC: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarC.backgroundImage = UIImage()
        tabBarC.tintColor = UIColor(named: "color_tab_bar_selected")
        tabBarC.unselectedItemTintColor = UIColor(named: "color_tab_bar_unselected")
    }
}
