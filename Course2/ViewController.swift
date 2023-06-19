//
//  ViewController.swift
//  Course2
//
//  Created by KietKoy on 16/06/2023.
//

import UIKit
import Foundation
class ViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.setLeftView(image: UIImage.init(named: "ic_search")!)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    @IBAction func seeAllButton(_ sender: UIButton) {
        guard let buttonTag = TagButton(rawValue: sender.tag) else {
            return
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        switch buttonTag {
        case .headphonesButton:
            vc.headTitle = "Headphones"
        case .guitarAmplifiersButton:
            vc.headTitle = "Guitar Amplifiers"
        case .midiKeyboardButton:
            vc.headTitle = "MIDI Keyboard"
        case .compressorEffectsPedals:
            vc.headTitle = "Compressor Effects Pedals"
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

enum TagButton: Int {
    case headphonesButton = 0
    case guitarAmplifiersButton
    case midiKeyboardButton
    case compressorEffectsPedals
}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    func setLeftView(image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 16, y: 16, width: 15, height: 16)) // set your Own size
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
        self.tintColor = .lightGray
    }
}
