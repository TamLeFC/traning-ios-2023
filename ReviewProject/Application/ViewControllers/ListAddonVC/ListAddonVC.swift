import UIKit
import RxDataSources
import RxSwift
import RxCocoa

class ListAddonVC: BaseVC<ListAddonVM> {
    @IBOutlet weak var listAddonCollectionView: UICollectionView!
    
    override func configureListView() {
        super.configureListView()
        
        setupCollectionView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        bindData()
    }
    
    override func addEventForViews() {
        super.addEventForViews()
        
        onItemSelected()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.listAddonCollectionView.collectionViewLayout.invalidateLayout()
        }, completion: nil)
    }
}

extension ListAddonVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return .init()
        }
        let collectionViewWidth = collectionView.frame.width
        let sectionInset = flowLayout.sectionInset.left * 2
        
        let numberOfColumns = CGFloat(calculateNumberOfColumns(for: collectionView))
        
        let availableWidth = collectionViewWidth - sectionInset * numberOfColumns
        let itemWidth = availableWidth / numberOfColumns
        let itemHeight = itemWidth * 0.97
        
        return .init(width: itemWidth, height: itemHeight)
    }
    
}

extension ListAddonVC {
    private func setupCollectionView() {
        let nib = UINib(nibName: ListAddonCollectionViewCell.identifier, bundle: nil)
        listAddonCollectionView.register(nib, forCellWithReuseIdentifier: ListAddonCollectionViewCell.identifier)
        
        listAddonCollectionView.delegate = self
    }
    
    private func bindData() {
        viewModel.addonsS
            .asObserver()
            .map { [SectionModel(model: (), items: $0)] }
            .bind(to: self.listAddonCollectionView.rx.items(dataSource: getAddonsDataSource()))
            .disposed(by: bag)
        
        viewModel.fetchData()
    }
    
    private func onItemSelected() {
        listAddonCollectionView
            .rx
            .modelSelected(Addon.self)
            .subscribe(onNext: { item in
                let vc = AddonDetailVC.instantiate(viewModel: AddonDetailVM(addon: item))
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: bag)
    }
    
    private func calculateNumberOfColumns(for collectionView: UICollectionView) -> Int {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return UIDevice.current.orientation.isLandscape ? 3 : 2
        } else if UIDevice.current.orientation.isLandscape {
            return 2
        }
        
        return 1
    }
}
