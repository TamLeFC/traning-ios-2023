//
//  SetupVC.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import UIKit
import RxSwift
import RxDataSources

class SetupVC: UIViewController {
    
    @IBOutlet weak var echoDotView: UIView!
    @IBOutlet weak var echoTapView: UIView!
    @IBOutlet weak var echoPlusView: UIView!
    @IBOutlet weak var echoView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var groupLabel: UILabel!
    
    private let viewModel = SetupVM()
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        groupLabel.font = UIFont(name: "Poppins-Bold", size: 16)
        
        bindViewModel()
        
        viewModel.fetchData()
    }
    
    private func initViews() {
        setupCollectionView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.echoDotView.addDropShadow(shadowRadius: 8, offset: CGSize(width: 0, height: 16), color: UIColor(hex: 0x024E66, alpha: 0.15))
            self.echoPlusView.addDropShadow(shadowRadius: 8, offset: CGSize(width: 0, height: 16), color: UIColor(hex: 0x024E66, alpha: 0.15))
            self.echoView.addDropShadow(shadowRadius: 8, offset: CGSize(width: 0, height: 16), color: UIColor(hex: 0x024E66, alpha: 0.15))
            self.echoTapView.addDropShadow(shadowRadius: 8, offset: CGSize(width: 0, height: 16), color: UIColor(hex: 0x024E66, alpha: 0.15))
        })
        echoDotView.layer.cornerRadius = 16
        echoView.layer.cornerRadius = 16
        echoTapView.layer.cornerRadius = 16
        echoPlusView.layer.cornerRadius = 16
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
        
        collectionView.showsVerticalScrollIndicator = false
    }

    private func bindViewModel() {
        viewModel.setupsS.asObservable()
            .map { [SectionModel(model: (), items: $0)] }
            .bind(to: self.collectionView.rx.items(dataSource: getSetupDataSource()))
            .disposed(by: bag)
    }
}

extension SetupVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let groupCellSpacing: CGFloat = 16
        let width = (collectionView.frame.width - groupCellSpacing) / 2
        let height = width / 2
        return CGSize(width: width, height: height)
    }
}
