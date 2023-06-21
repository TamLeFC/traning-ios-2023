//
//  HomeVC.swift
//  course_4
//
//  Created by Mobile Dev on 21/06/2023.
//

import UIKit

class HomeVC: UIViewController{
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var topMovieView: GradientView!
    @IBOutlet weak var topMovieImageView: UIImageView!
    
    @IBOutlet weak var rateView: GradientView!
    
    @IBOutlet weak var movieImageView1: UIImageView!
    @IBOutlet weak var movieImageView2: UIImageView!
    @IBOutlet weak var movieImageView3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView.layer.cornerRadius = 24
        
        let placeHolderText = "Seach movie..."
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(named: "color_search")!,
                                                         .font : UIFont.systemFont(ofSize: 20, weight: .light)]
        let attributedPlaceholder = NSAttributedString(string: placeHolderText, attributes: attributes)
        searchTextField.attributedPlaceholder = attributedPlaceholder
        
        homeScrollView.showsVerticalScrollIndicator = false
        
        topMovieView.layer.cornerRadius = 24
        topMovieImageView.contentMode = .scaleAspectFill
        
        rateView.layer.cornerRadius = 24
        
        movieImageView1.contentMode = .scaleAspectFill
        movieImageView2.contentMode = .scaleAspectFill
        movieImageView3.contentMode = .scaleAspectFill
        
        
    }
    

}
