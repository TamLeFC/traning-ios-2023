import UIKit
import RxDataSources

class HomeVC: BaseVC<HomeVM> {

    
    @IBOutlet weak var listKnotCollectionView: UICollectionView!
    
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
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = collectionView.frame.width - flowLayout.sectionInset.left * 2
            
            return CGSize(width: width, height: width / 3)
        }
        
        return CGSize()
    }
    
}

extension HomeVC {
    private func setupCollectionView() {
        let nib = UINib(nibName: HomeCollectionViewCell.identifier, bundle: nil)
        listKnotCollectionView.register(nib, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        
        listKnotCollectionView.delegate = self
    }
    
    private func bindData() {
        viewModel.knotsS
            .asObserver()
            .map { [SectionModel(model: (), items: $0)] }
            .bind(to: self.listKnotCollectionView.rx.items(dataSource: getKnotsDataSource()))
            .disposed(by: bag)
        
        viewModel.fetchData()
    }
    
    private func onItemSelected() {
        
        listKnotCollectionView
            .rx
            .modelSelected(Addon.self)
            .subscribe(onNext: { item in
                let vc = KnotDetailVC.instantiate(viewModel: KnotDetailVM(id: item.itemId))
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: bag)
    }
}
