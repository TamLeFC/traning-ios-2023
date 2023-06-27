//
//  CommandVC.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import UIKit

class CommandVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = CommandVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
    }
    
    private func initViews() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 24, left: 0, bottom: 24, right: 0)
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        let identifier = "CommandCell"
        let nib = UINib(nibName: identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.showsVerticalScrollIndicator = false
    }
}

extension CommandVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let commandCellSpacing: CGFloat = 16
        let width = (collectionView.frame.width - (commandCellSpacing * 3) ) / 4
        let height = width + 30
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = VoiceVC(viewModel.categories[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CommandVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommandCell", for: indexPath) as! CommandCell
        cell.configure(viewModel.categories[indexPath.row])
        return cell
    }
}
