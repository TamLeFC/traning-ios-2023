import UIKit

class DetailMovieVC: UIViewController {

    @IBOutlet weak var backImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        backImageView.addGestureRecognizer(tapGR)
        backImageView.isUserInteractionEnabled = true
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
}
