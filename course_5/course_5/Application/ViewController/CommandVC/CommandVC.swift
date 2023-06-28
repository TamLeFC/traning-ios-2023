//
//  CommandVC.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import UIKit
import RxSwift
import RxDataSources

class CommandVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel = CommandVM()
    
    private let bag = DisposeBag()
    
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
        layout.sectionInset = UIEdgeInsets(top: 24, left: 0, bottom: 24, right: 0)
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        let identifier = "CommandCell"
        let nib = UINib(nibName: identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
        
        collectionView.delegate = self
 
        collectionView.showsVerticalScrollIndicator = false
    }
    
    private func bindViewModel(){
        viewModel.categoriesS.asObserver()
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
//        let vc = VoiceVC(viewModel.categories[indexPath.row])
//        navigationController?.pushViewController(vc, animated: true)
    }
}
