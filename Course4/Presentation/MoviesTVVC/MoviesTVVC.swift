import UIKit

class MoviesTVVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func onMovieTapped(_ sender: Any) {
        let detailVC = DetailMovieVC()
        
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
