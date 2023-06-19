//
//  DetailViewController.swift
//  Course2
//
//  Created by Mobile Dev 1 on 19/06/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receivedData: String?
    
    @IBOutlet weak var navigationItemBar: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItemBar.title = receivedData ?? "Title"

        navigationItemBar.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark.circle"), style: .plain, target: self, action: #selector(backAction))
    }

    @objc func backAction(){
        self.dismiss(animated: true, completion: nil)
    }
}
