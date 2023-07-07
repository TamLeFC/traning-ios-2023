//
//  CommandVC.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import UIKit
import RxSwift
import RxDataSources

class CategoryVC: BaseVC<CategoryVM> {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CategoryVM()
        
        bindViewModel()
        viewModel.fetchData()
    }
    
    override func initViews() {
        super.initViews()
    }
    
    override func configureListView() {
        super.configureListView()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 24, left: 0, bottom: 24, right: 0)
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.registerCellNib(CategoryCell.self)
        
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
    }
    
    override func bindViewModel(){
        super.bindViewModel()
        
        viewModel?.categoriesS.asObservable()
            .map{ [SectionModel(model: (), items: $0)] }
            .bind(to: self.collectionView.rx.items(dataSource: getCategoriesDataSource()))
            .disposed(by: bag)
    }
    
}

extension CategoryVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let commandCellSpacing: CGFloat = 16
        let width = (collectionView.frame.width - (commandCellSpacing * 3) ) / 4
        let height = width + 30
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        do {
            let selectedCategory: Category = try collectionView.rx.model(at: indexPath)
            let commandVM = CommandVM(selectedCategory)
            let vc = CommandVC.instantiate(viewModel: commandVM)
            navigationController?.pushViewController(vc, animated: true)
        } catch {
            
        }
    }
}
