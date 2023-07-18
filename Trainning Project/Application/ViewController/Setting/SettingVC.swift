//
//  SettingVC.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import UIKit

class SettingVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureListView()
    }
    
    private func initViews() {
        
    }
    
    private func configureListView() {
        collectionView.registerCellNib(SettingCell.self)
    }
}

extension SettingVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
}
