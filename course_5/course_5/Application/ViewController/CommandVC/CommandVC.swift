//
//  CommandVC.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import UIKit
import RxSwift
import RxDataSources

class CommandVC: BaseVC<CommandVM> {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CommandVM()
        
        initViews()
        bindViewModel()
        viewModel.fetchData()
    }
    
    override func initViews() {
        super.initViews()
        configureListView()
    }
    
    override func configureListView() {
        super.configureListView()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 24, left: 0, bottom: 24, right: 0)
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        let nib = UINib(nibName: CommandCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CommandCell.identifier)
        
        collectionView.delegate = self
 
        collectionView.showsVerticalScrollIndicator = false
    }
    
    override func bindViewModel(){
        super.bindViewModel()
        
        viewModel?.categoriesS
            .subscribe(onNext: { [weak self] categories in
                self?.categories = categories
            })
            .disposed(by: bag)
        viewModel?.categoriesS.asObserver()
            .map{ [SectionModel(model: (), items: $0)] }
            .bind(to: self.collectionView.rx.items(dataSource: getCategoriesDataSource()))
            .disposed(by: bag)
       
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
        let selectedCategory = VoiceVM(viewModel.categories[indexPath.row])
        let vc = VoiceVC.instantiate(viewModel: selectedCategory)
        navigationController?.pushViewController(vc, animated: true)
    }
}
