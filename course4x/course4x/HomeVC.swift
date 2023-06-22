//
//  HomeVC.swift
//  course4x
//
//  Created by Mobile Dev on 22/06/2023.
//

import UIKit

class HomeVC: UIViewController {

    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var topMovieView: GradientView!
    @IBOutlet weak var rateMovieView: GradientView!
    @IBOutlet weak var topMovieImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        searchView.layer.cornerRadius = 24
        
        let placeHolderText = "Seach movie..."
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(named: "color_icon")!,
                                                         .font : UIFont.systemFont(ofSize: 20, weight: .light)]
        let attributedPlaceholder = NSAttributedString(string: placeHolderText, attributes: attributes)
        searchTextField.attributedPlaceholder = attributedPlaceholder
        
        topMovieView.layer.cornerRadius = 26
        rateMovieView.layer.cornerRadius = 26
        
        topMovieImageView.contentMode = .scaleToFill
    }


}
