import UIKit

class MainVC: BaseVC<BaseVM> {

    @IBOutlet weak var titleHeaderLabel: UILabel!
    @IBOutlet weak var pageMainView: UIView!
    @IBOutlet weak var homeTabImageView: UIImageView!
    @IBOutlet weak var setupTabImageView: UIImageView!
    private var pageVC: MainPageVC!
    
    override func initViews() {
        super.initViews()
        
        setupMainPageView()
    }
    
    override func addEventForViews() {
        super.addEventForViews()
        
        onHomeTabTapped()
    }
}

extension MainVC {
    private func setupMainPageView() {
        pageVC = MainPageVC()
        
        addChild(pageVC)
        pageVC.view.frame = pageMainView.bounds
        pageMainView.addSubview(pageVC.view)
        
        pageVC.didMove(toParent: self)
    }
    
    @IBAction func onHomeTabTapped(_ sender: Any) {
        onHomeTabTapped()
    }
    
    
    @IBAction func onSetupTabTapped(_ sender: Any) {
        onSetupTabTapped()
    }
    
    func onHomeTabTapped() {
        titleHeaderLabel.text = "Commands"
        
        homeTabImageView.isHighlighted = true
        setupTabImageView.isHighlighted = false
        
        pageVC.handleChangePage(pageIndex: 0)
    }
    
    func onSetupTabTapped() {
        titleHeaderLabel.text = "Setup"
        
        homeTabImageView.isHighlighted = false
        setupTabImageView.isHighlighted = true
        
        pageVC.handleChangePage(pageIndex: 1)
    }
}
