//
//  ViewController.swift
//  course_2
//
//  Created by Mobile Dev on 19/06/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBOutlet weak var UIViewHeadphones: UIView!
    @IBOutlet weak var UIViewGuitar: UIView!
    @IBOutlet weak var UIViewMIDI: UIView!
    @IBOutlet weak var UIViewCompressor: UIView!
    
    @IBOutlet weak var ViewIconHeadphones: UIView!
    @IBOutlet weak var ViewIconMIDI: UIView!
    @IBOutlet weak var ViewIconGuitar: UIView!
    @IBOutlet weak var ViewIconCompressor: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)

        SearchBar.searchTextField.attributedPlaceholder = NSAttributedString(string:"Type something here to search", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        UILabel.appearance(whenContainedInInstancesOf: [UISearchBar.self]).font = UIFont.systemFont(ofSize: 12)
        UILabel.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = UIColor.white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = UIColor.white
        
        UIViewHeadphones.layer.cornerRadius = 20
        UIViewGuitar.layer.cornerRadius = 20
        UIViewMIDI.layer.cornerRadius = 20
        UIViewCompressor.layer.cornerRadius = 20
        
        ViewIconHeadphones.layer.cornerRadius = 7
        ViewIconGuitar.layer.cornerRadius = 7
        ViewIconMIDI.layer.cornerRadius = 7
        ViewIconCompressor.layer.cornerRadius = 7
    }
}

