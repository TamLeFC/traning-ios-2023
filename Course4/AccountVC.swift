import UIKit

class AccountVC: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var premiumButtonView: GradientView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.alpha = 0.6
        blurView.frame = backgroundImageView.bounds
        backgroundImageView.addSubview(blurView)
        
        premiumButtonView.layer.shadowColor = UIColor(named: "color_button_shadow")?.cgColor
        premiumButtonView.layer.shadowOffset = CGSize(width: 0, height: 4)
        premiumButtonView.layer.shadowRadius = 8
    }
}
