//
//  DetailViewController.swift
//  Course2
//
//  Created by KietKoy on 19/06/2023.
//

import UIKit
import Foundation
class DetailViewController: UIViewController {

    @IBOutlet weak var containerImageView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var headTitleLabel: UILabel!
    var headTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    @IBAction func closeButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func initView() {
        // HeadTitle
        headTitleLabel.text = headTitle
        //Container Image View
        containerImageView.layer.cornerRadius = 8
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: containerImageView.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
        containerImageView.layer.mask = maskLayer
        //Label
        let textDescription = "Great Budget Option For A Studio Headphone, Really Good For The Price. This Headphone Has Great Clarity And Comfortable Enough For Long Sessions...See All"
        let keyText = "See All"
        let range = (textDescription as NSString).range(of: keyText)
        let arrtributedText = NSMutableAttributedString.init(string: textDescription)
        arrtributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "buttonColor")!, range: range)
        descriptionLabel.attributedText = arrtributedText
    }
}
