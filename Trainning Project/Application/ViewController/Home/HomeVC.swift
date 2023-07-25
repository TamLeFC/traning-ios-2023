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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
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
        if UIDevice.current.userInterfaceIdiom == .phone {
            return calculateCellSizeForIphone()
        } else {
            return calculateCellSizeForIpad()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        24
    }
}

//MARK: - calculate Cell Size

extension HomeVC {
    private func calculateCellSizeForIphone() -> CGSize {
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        if UIDevice.current.orientation.isLandscape {
            width = (collectionView.frame.width - 16) / 2
        } else {
            width = collectionView.frame.width
        }
        
        height = (width * 332) / 327
        
        return CGSize(width: width, height: height)
    }
    
    private func calculateCellSizeForIpad() -> CGSize {
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        if UIDevice.current.orientation.isLandscape {
            width = (UIScreen.main.bounds.width - 24 * 2)/2
            height = width * 0.9
            print("width lanscape: \(width)")
        } else {
            width = min(collectionView.frame.width, UIScreen.main.bounds.width)
            height = width * 0.8
        }
        
        return CGSize(width: width, height: height)
    }
}
