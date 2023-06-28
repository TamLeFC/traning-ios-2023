//
//  HomeVC.swift
//  course2
//
//  Created by Sơn Lê on 19/05/2023.
//

import UIKit
import RxSwift
import RxDataSources

class HomeVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let bag = DisposeBag()
    
    private var viewModel: HomeVM = HomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        bindViewModel()
        
        viewModel.fetchData()
    }
    
    private func initViews() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        let identifier = "CategoryCell"
        let nib = UINib(nibName: identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
        
        collectionView.delegate = self
        
        collectionView.showsVerticalScrollIndicator = false
    }
    
    private func bindViewModel() {
        viewModel.categoriesS.asObservable()
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = CommandVC(viewModel.categories[indexPath.row])
//        navigationController?.pushViewController(vc, animated: true)
    }
}
