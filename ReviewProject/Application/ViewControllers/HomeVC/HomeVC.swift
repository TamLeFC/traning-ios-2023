import UIKit
import RxDataSources

class HomeVC: BaseVC<HomeVM> {

    
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

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
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

extension HomeVC {
    private func setupCollectionView() {
        let nib = UINib(nibName: HomeCollectionViewCell.identifier, bundle: nil)
        listAddonCollectionView.register(nib, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        
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
                let vc = KnotDetailVC.instantiate(viewModel: KnotDetailVM(id: item.itemId))
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: bag)
    }
}
