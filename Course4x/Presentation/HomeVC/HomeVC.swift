//
//  HomeVC.swift
//  Course4x
//
//  Created by KietKoy on 22/06/2023.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var iconMicView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    @IBAction func movieItemPressed(_ sender: UIButton) {
        let vc = DetailVC()
        vc.titleMovie = sender.currentTitle!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    private func initView() {
        iconMicView.addLeftBorder(with: UIColor(named: "border")!, andWidth: 1.0)
        setupSearchTextField()
    }
    private func setupSearchTextField() {
        searchTextField.layer.cornerRadius = 24
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor(named: "border")?.cgColor
        searchTextField.layer.masksToBounds = true
        searchTextField.setLeftView(image: UIImage(named: "ic_search")!)
        searchTextField.addPaddingToTextField(.right, width: 60)
    }

}
