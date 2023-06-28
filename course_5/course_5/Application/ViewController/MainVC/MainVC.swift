//
//  MainVC.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var setupImageView: UIImageView!
    @IBOutlet weak var pageView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var appLabel: UILabel!
    
    private var pageVC: MainPageVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true

        appLabel.font = UIFont(name: "Inter-Medium", size: 16)
        titleLabel.font = UIFont(name: "Poppins-Bold", size: 20)
        
        setupPageView()
        selectHome()
    }
    
    private func setupPageView()
    {
        pageVC = MainPageVC()
        
        addChild(pageVC)
        pageVC.view.frame = pageView.bounds
        pageView.addSubview(pageVC.view)
        
        pageVC.didMove(toParent: self)
        
    }
    @IBAction func homeButtonTapped(_ sender: Any){
        selectHome()
    }
    
    @IBAction func setupButtonTapped(_sender: Any){
        selectSetup()
    }
    
    private func selectHome(){
        homeImageView.isHighlighted = true
        setupImageView.isHighlighted = false
        
        titleLabel.text = "Commands"
        pageVC.handleUIChangePage(pageIndex: 0)
    }
    
    private func selectSetup(){
        homeImageView.isHighlighted = false
        setupImageView.isHighlighted = true
        
        titleLabel.text = "Setup"
        pageVC.handleUIChangePage(pageIndex: 1)
    }
    
}
