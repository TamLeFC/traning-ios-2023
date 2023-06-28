//
//  HomeVC.swift
//  Course5
//
//  Created by KietKoy on 26/06/2023.
//

import UIKit
import RxSwift
import RxDataSources

class HomeVC: UIViewController {
    private var viewModel: HomeVM = HomeVM()
    private let bag = DisposeBag()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        bindViewModel()
        
        viewModel.fetchData()
    }
    
    private func initView() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.delegate = self
        //        collectionView.dataSource = self
        
        let nib = UINib(nibName: CategoryCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CategoryCell.identifier)
        collectionView.reloadData()
        
        collectionView.showsVerticalScrollIndicator = false
    }
    
    private func bindViewModel() {
        viewModel.categorieS.asObservable()
            .map { [SectionModel(model: (), items: $0)] }
            .bind(to: self.collectionView.rx.items(dataSource: getCagegoriesDataSource()))
            .disposed(by: bag)
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let categoryCellSpacing: CGFloat = 16
        let width = (collectionView.frame.width - (categoryCellSpacing * 3) ) / 4
        let height = width + 30
        return CGSize(width: width, height: height)
    }
}

extension HomeVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CommandDetailVC()
        
        viewModel.categorieS.subscribe(onNext: { [weak self] categories in
            guard self != nil else {
                return
            }
            if indexPath.row < categories.count {
                let selectedCategory = categories[indexPath.row]
                vc.commands = selectedCategory.commands
                vc.titleText = selectedCategory.displayName
            }
        }).disposed(by: bag)
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        viewModel.fetchData()
    }
}







