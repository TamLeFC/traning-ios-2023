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
        let layout = SharedFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}

//MARK: - UICollectionViewLayout

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return CollectionViewCellSizeCalculator.calculateCellSizeForIphone(in: collectionView)
        } else {
            return CollectionViewCellSizeCalculator.calculateCellSizeForIpad(in: collectionView)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
}

//MARK: - Update the UI when the screen transitions

extension HomeVC {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        collectionView.collectionViewLayout.invalidateLayout()
    }
}
