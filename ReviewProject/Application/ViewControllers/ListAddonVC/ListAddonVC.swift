import UIKit
import RxDataSources

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
        
        
    }
}

extension ListAddonVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let collectionViewWidth = collectionView.frame.width
        let sectionInset = flowLayout.sectionInset.left * 2
        
        var numberOfColumns = 1.0
        
        if UIDevice.current.userInterfaceIdiom == .pad && UIDevice.current.orientation.isLandscape {
            numberOfColumns = 3.0
        } else if UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.orientation.isLandscape {
            numberOfColumns = 2.0
        }
        
        let availableWidth = collectionViewWidth - sectionInset * numberOfColumns
        let itemWidth = availableWidth / numberOfColumns
        let itemHeight = itemWidth * 0.97
        
        return CGSize(width: itemWidth, height: itemHeight)
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
}
