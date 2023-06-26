//
//  MainVC.swift
//  course2
//
//  Created by Sơn Lê on 18/05/2023.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var pageView: UIView!
    @IBOutlet weak var navHomeImageView: UIImageView!
    @IBOutlet weak var navSetupImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    private var pageVC: MainPageVC!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.isHidden = true
        
        setupPageView()
        // select home first when init
        selectNavHome()
    }

    @IBAction func navHomeButtonTapped(_ sender: Any) {
        selectNavHome()
    }
    
    @IBAction func navSetupButtonTapped(_ sender: Any) {
        selectNavSetup()
    }
    private func setupPageView() {
        pageVC = MainPageVC()
        
        addChild(pageVC)
        pageVC.view.frame = pageView.bounds
        pageView.addSubview(pageVC.view)
        
        pageVC.didMove(toParent: self)
    }
    
    private func selectNavHome() {
        navHomeImageView.isHighlighted = true
        navSetupImageView.isHighlighted = false
        
        titleLabel.text = "Commands"
        pageVC.handleUIChangePage(pageIndex: 0)
    }
    
    private func selectNavSetup() {
        navHomeImageView.isHighlighted = false
        navSetupImageView.isHighlighted = true
        
        titleLabel.text = "Setup"
        pageVC.handleUIChangePage(pageIndex: 1)
    }

}
