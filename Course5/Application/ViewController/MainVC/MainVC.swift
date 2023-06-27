//
//  MainVC.swift
//  Course5
//
//  Created by KietKoy on 26/06/2023.
//

import UIKit

class MainVC: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var pageView: UIView!
    
    
    @IBOutlet weak var homeImageView: UIImageView!
    
    
    @IBOutlet weak var setupImageView: UIImageView!
    
    
    private var pageViewVC: MainPageVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupPageView()
        selectNavHome()
    }
    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        selectNavHome()
    }
    
    @IBAction func setupButtonPressed(_ sender: UIButton) {
        selectNavSetup()
    }
    private func setupPageView() {
        pageViewVC = MainPageVC()
        
        addChild(pageViewVC)
        pageViewVC.view.frame = pageView.bounds
        pageView.addSubview(pageViewVC.view)
        
        pageViewVC.didMove(toParent: self)
    }
    private func selectNavHome() {
        titleLabel.text = "Commands"
        homeImageView.isHighlighted = true
        setupImageView.isHighlighted = false
        pageViewVC.handleUIChangePage(pageIndex: 0)
    }
    private func selectNavSetup() {
        titleLabel.text = "Setup"
        homeImageView.isHighlighted = false
        setupImageView.isHighlighted = true
        pageViewVC.handleUIChangePage(pageIndex: 1)
    }
}
