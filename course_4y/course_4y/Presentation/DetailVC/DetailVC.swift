//
//  DetailVC.swift
//  course_4y
//
//  Created by Mobile Dev on 23/06/2023.
//

import UIKit
import Cosmos

class DetailVC: UIViewController {
    
    var data: String?

    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var watchTrailerView: UIView!
    
    @IBOutlet weak var movieImageView: UIImageView!

    @IBOutlet weak var trailerImageView1: UIImageView!
    @IBOutlet weak var trailerImageView2: UIImageView!
    
    var isBookMark = false
    let rightButton = UIButton(type: .custom)
    let leftButton = UIButton(type: .custom)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.backgroundColor = .clear
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for family in UIFont.familyNames {
            print("Font Family: \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("    \(name)")
            }
        }

        
        let textSize: CGFloat = 20.0
        let font = UIFont.systemFont(ofSize: textSize)
        cosmosView.settings.textFont = font
        cosmosView.settings.fillMode = .precise
        
        if let data = data, let rating = Double(data) {
            cosmosView.rating = rating
            cosmosView.text = data
            cosmosView.update()
        }
        
        watchTrailerView.layer.cornerRadius = 8
        
        trailerImageView1.contentMode = .scaleToFill
        trailerImageView2.contentMode = .scaleToFill
    
        
        rightButton.setImage(UIImage(named: "ic_bookmark"), for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        let itemRight = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = itemRight
        
        
        leftButton.setImage(UIImage(named: "ic_back"), for: .normal)
        leftButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        let itemLeft = UIBarButtonItem(customView: leftButton)
        navigationItem.leftBarButtonItem = itemLeft
        
    }
    
    @objc func rightButtonTapped() {
        
        if isBookMark {
            rightButton.setImage(UIImage(named: "ic_bookmarked"), for: .normal)
        }
        else
        {
            rightButton.setImage(UIImage(named: "ic_bookmark"), for: .normal)
        }
        isBookMark.toggle()
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

}
