//
//  MainVC.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tabView: UIView!
    @IBOutlet weak var mainPageView: UIView!
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var favoriteImageview: UIImageView!
    @IBOutlet weak var settingImageView: UIImageView!
    
    private var pageVC: MainPageVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupPageView()
        selectHome()
    }
    
    private func setupUI() {
        titleLabel.font = UIFont(name: "minecrafter_reg", size: 24)
        tabView.clipsToBounds = true
        tabView.layer.cornerRadius = 16
        tabView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        homeImageView.isHighlighted = true
    }
    
    private func setupPageView() {
        pageVC = MainPageVC()
        
        addChild(pageVC)
        pageVC.view.frame = mainPageView.bounds
        mainPageView.addSubview(pageVC.view)
        
        pageVC.didMove(toParent: self)
    }
    
    @IBAction func notifyButtonTapped(_ sender: Any) {
        navigationController?.pushViewController(DetailVC(), animated: true)
    }
    
    @IBAction func mainHomeButtonTapped(_ sender: Any) {
        selectHome()
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        selectFavorite()
    }
    
    @IBAction func settingButtonTapped(_ sender: Any) {
        selectSetting()
    }
    
    private func selectHome() {
        homeImageView.isHighlighted = true
        favoriteImageview.isHighlighted = false
        settingImageView.isHighlighted = false
        
        titleLabel.text = "HOME"
        
        pageVC.handleUIChangePage(pageIndex: 0)
    }
    
    private func selectFavorite() {
        homeImageView.isHighlighted = false
        favoriteImageview.isHighlighted = true
        settingImageView.isHighlighted = false
        
        titleLabel.text = "FAVORITES"
        
        pageVC.handleUIChangePage(pageIndex: 1)
    }
    
    private func selectSetting() {
        homeImageView.isHighlighted = false
        favoriteImageview.isHighlighted = false
        settingImageView.isHighlighted = true
        
        titleLabel.text = "SETTING"
        
        pageVC.handleUIChangePage(pageIndex: 2)
    }

}
