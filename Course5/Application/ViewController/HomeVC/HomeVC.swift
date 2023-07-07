//
//  HomeVC.swift
//  Course5
//
//  Created by KietKoy on 26/06/2023.
//

import UIKit
import RxSwift
import RxDataSources
import RxRealm
import RealmSwift

class HomeVC: BaseVC<HomeVM> {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchData()
    }
    
    
    override func configureListView() {
        super.configureListView()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.registerCellNib(CategoryCell.self)
        
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.showsVerticalScrollIndicator = false
    }
    
    
    override func bindViewModel() {
        super.bindViewModel()
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
}

extension HomeVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        do {
            let item: Category = try collectionView.rx.model(at: indexPath)
            let vc = CommandDetailVC.instantiate(viewModel: CommandDetailVM(item))
            navigationController?.pushViewController(vc, animated: true)
        } catch {
        }
    }
}







