import UIKit

class MainVC: BaseVC<BaseVM> {
    @IBOutlet weak var titleHeaderLabel: UILabel!
    @IBOutlet weak var pageMainView: UIView!
    @IBOutlet weak var homeTabImageView: UIImageView!
    @IBOutlet weak var favoriteTabImageView: UIImageView!
    @IBOutlet weak var settingTabImageView: UIImageView!
    
    
    @IBAction func onHomeTabTapped(_ sender: Any) {
        setupOnTapTapped(title: "Home", pageIndex: 0)
    }
    
    @IBAction func onFavoriteTabTapped(_ sender: Any) {
        setupOnTapTapped(title: "Favorites", pageIndex: 1)
    }
    
    @IBAction func onSettingTabTapped(_ sender: Any) {
        setupOnTapTapped(title: "Setting", pageIndex: 2)
    }
    
    @IBAction func onNotiTapped(_ sender: Any) {
        popupAlert(title: "Notification",
                   message: "Message from notification",
                   actionTitles: ["OK", "Cancel"],
                   actions: [nil, nil])
    }
    
    private var pageVC: MainPageVC!
    override func initViews() {
        super.initViews()
        
        setupMainPageView()
    }
    
    override func addEventForViews() {
        super.addEventForViews()
        
        setupOnTapTapped(title: "Home", pageIndex: 0)
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
    
    private func setupOnTapTapped(title: String, pageIndex: Int) {
        titleHeaderLabel.text = title.uppercased()
        
        homeTabImageView.isHighlighted = pageIndex == 0
        favoriteTabImageView.isHighlighted = pageIndex == 1
        settingTabImageView.isHighlighted = pageIndex == 2

        pageVC.handleChangePage(pageIndex: pageIndex)
    }
}
