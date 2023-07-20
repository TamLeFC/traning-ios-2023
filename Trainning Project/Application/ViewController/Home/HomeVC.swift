//
//  HomeVC.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import UIKit
import RxDataSources

class HomeVC: BaseVC<HomeVM> {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchData()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.addonsS.asObserver()
            .map { [SectionModel(model: (), items: $0)] }
            .bind(to: self.collectionView.rx.items(dataSource: getAddonsDataSource() {[weak self] addon in
                guard let self = self else { return }
                self.navigationController?.pushViewController(
                    DetailAddonVC.instantiate(viewModel: DetailAddonVM(addon)),
                    animated: true)
            }))
            .disposed(by: bag)
    }
    
    override func configureListView() {
        super.configureListView()
        
        configureCollectionViewLayout()
        collectionView.delegate = self
        collectionView.registerCellNib(AddonCell.self)
    }
    
    private func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}

//MARK: - UICollectionViewLayout

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = collectionView.frame.width
        var height: CGFloat = 0
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            let screenHeight = UIScreen.main.bounds.height
            height = screenHeight / 2
            return CGSize(width: width, height: height)
        } else {
            height = (width * 332) / 327
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        24
    }
}
