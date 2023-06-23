import UIKit

class AccountVC: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var premiumButtonView: GradientView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
//        let blurView = UIVisualEffectView(effect: blurEffect)
//        blurView.alpha = 0.6
//        blurView.frame = backgroundImageView.bounds
//        backgroundImageView.addSubview(blurView)
        backgroundImageView.image = "img_account_background".toUIImage?.asBlurImage(radius: 40)
        
        premiumButtonView.layer.shadowColor = UIColor(named: "color_button_shadow")?.cgColor
        premiumButtonView.layer.shadowOpacity = 1
        premiumButtonView.layer.shadowOffset = CGSize(width: 0, height: 4)
        premiumButtonView.layer.shadowRadius = 16
    }
}
