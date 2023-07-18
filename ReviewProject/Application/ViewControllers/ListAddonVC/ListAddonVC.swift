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
}

extension ListAddonVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let size = collectionView.frame.width - flowLayout.sectionInset.left * 2
            
            return CGSize(width: size, height: size * 0.95)
        }
        
        return CGSize()
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
