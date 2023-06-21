//
//  MovieTvController.swift
//  learn
//
//  Created by Foxcode on 16/05/2023.
//

import SwiftUI

class MovieTvController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var searchBarBackground: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    private func setupView() {
        searchBarBackground.layer.borderWidth = 1
        searchBarBackground.layer.borderColor = UIColor(named: "gray_01")?.cgColor
        searchBarBackground.layer.cornerRadius = 24
        searchBarBackground.clipsToBounds = true
        
        // hide keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        scrollView.addGestureRecognizer(tapGesture)
        scrollView.keyboardDismissMode = .onDrag

    }
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func seachfieldClick(_ sender: Any) {
        
    }
}

