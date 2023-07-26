//
//  MainVC.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pageView: UIView!
    @IBOutlet weak var homeIcon: UIImageView!
    @IBOutlet weak var favoriteIcon: UIImageView!
    @IBOutlet weak var settingIcon: UIImageView!
    
    private var pageViewVC: MainPageVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    private func initViews() {
        navigationController?.navigationBar.isHidden = true
        
        setupPageView()
        
        selectNavHome()
    }
    
    @IBAction func homeButtonTouched(_ sender: UIButton) {
        selectNavHome()
    }
    
    @IBAction func settingButtonTouched(_ sender: UIButton) {
        selectNavSetting()
    }
    
    @IBAction func favoriteButtonTouched(_ sender: UIButton) {
        selectNavFavorite()
    }
    
    @IBAction func alertButton(_ sender: UIButton) {
        // create the alert
        let alert = UIAlertController(title: "Notification",
                                      message: "This is my message.",
                                      preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setupPageView() {
        pageViewVC = MainPageVC()
        
        addChild(pageViewVC)
        pageViewVC.view.frame = pageView.bounds
        pageView.addSubview(pageViewVC.view)
        
        pageViewVC.didMove(toParent: self)
    }
    
    private func selectNavHome() {
        titleLabel.text = "HOME"
        
        homeIcon.isHighlighted = true
        settingIcon.isHighlighted = false
        favoriteIcon.isHighlighted = false
        
        pageViewVC.handleUIChangePage(pageIndex: 0)
    }
    
    private func selectNavFavorite() {
        titleLabel.text = "FAVORITES"
        
        homeIcon.isHighlighted = false
        favoriteIcon.isHighlighted = true
        settingIcon.isHighlighted = false
        
        pageViewVC.handleUIChangePage(pageIndex: 1)
    }
    
    private func selectNavSetting() {
        titleLabel.text = "SETTING"
        
        homeIcon.isHighlighted = false
        favoriteIcon.isHighlighted = false
        settingIcon.isHighlighted = true
        
        pageViewVC.handleUIChangePage(pageIndex: 2)
    }
    
}
