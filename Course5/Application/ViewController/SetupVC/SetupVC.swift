//
//  SetupVC.swift
//  Course5
//
//  Created by KietKoy on 26/06/2023.
//

import UIKit
import RxSwift
import RxDataSources

class SetupVC: BaseVC<SetupVM> {
    
    @IBOutlet weak var echoDotContainerView: UIView!
    @IBOutlet weak var echoPlusContainerView: UIView!
    @IBOutlet weak var tapContainerView: UIView!
    @IBOutlet weak var echoContainerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureListView()
        viewModel.fetchData()
    }
    
    override func initViews() {
        super.initViews()
        
        setupUIView()
    }
    
    override func configureListView() {
        super.configureListView()
        
        setupCollectionView()
    }
    
    private func setupUIView() {
        echoContainerView.addDropShadow(shadowRadius: 16, offset: CGSize(width: 0, height: 8), color: UIColor(hex: 0x024E66, alpha: 0.2))
        echoDotContainerView.addDropShadow(shadowRadius: 16, offset: CGSize(width: 0, height: 8), color: UIColor(hex: 0x024E66, alpha: 0.2))
        tapContainerView.addDropShadow(shadowRadius: 16, offset: CGSize(width: 0, height: 8), color: UIColor(hex: 0x024E66, alpha: 0.2))
        echoPlusContainerView.addDropShadow(shadowRadius: 16, offset: CGSize(width: 0, height: 8), color: UIColor(hex: 0x024E66, alpha: 0.2))
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.delegate = self
        
        let nib = UINib(nibName: SetupCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: SetupCell.identifier)
        collectionView.reloadData()
        
        collectionView.showsVerticalScrollIndicator = false
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        viewModel.setupS.asObservable()
            .map { [SectionModel(model: (), items: $0)] }
            .bind(to: self.collectionView.rx.items(dataSource: getSetupsDataSource()))
            .disposed(by: bag)
    }
}

extension SetupVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let setupCellSpacing: CGFloat = 8
        let width = (collectionView.frame.width - (setupCellSpacing * 2)) / 2
        let height = width / 2
        return CGSize(width: width, height: height)
    }
}
