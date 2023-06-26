//
//  SetupVC.swift
//  course2
//
//  Created by Sơn Lê on 22/05/2023.
//

import UIKit

class SetupVC: UIViewController {

    @IBOutlet weak var echoDotView: UIView!
    
    @IBOutlet weak var echoPlusView: UIView!
    
    @IBOutlet weak var echoView: UIView!
    @IBOutlet weak var tapView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = SetupVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        initViews()
    }
    
    private func initViews() {
        setupCollectionView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.echoDotView.addDropShadow(shadowRadius: 8, offset: CGSize(width: 0, height: 16), color: UIColor(hex: 0x024E66, alpha: 0.15))
            self.echoPlusView.addDropShadow(shadowRadius: 8, offset: CGSize(width: 0, height: 16), color: UIColor(hex: 0x024E66, alpha: 0.15))
            self.echoView.addDropShadow(shadowRadius: 8, offset: CGSize(width: 0, height: 16), color: UIColor(hex: 0x024E66, alpha: 0.15))
            self.tapView.addDropShadow(shadowRadius: 8, offset: CGSize(width: 0, height: 16), color: UIColor(hex: 0x024E66, alpha: 0.15))
        })
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        let identifier = "GroupCell"
        let nib = UINib(nibName: identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.showsVerticalScrollIndicator = false
    }

}

extension SetupVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let categoryCellSpacing: CGFloat = 16
        let width = (collectionView.frame.width - categoryCellSpacing) / 2
        let height = width / 2
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = CommandVC(viewModel.setups[indexPath.row])
//        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SetupVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.setups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCell", for: indexPath) as! GroupCell
        cell.configure(viewModel.setups[indexPath.row])
        return cell
    }
}
