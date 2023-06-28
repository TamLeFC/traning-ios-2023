import UIKit
import RxSwift
import RxDataSources

class HomeVC: BaseVC<HomeVM> {
    
    @IBOutlet weak var commandCollectionView: UICollectionView!
    
    override func configureListView() {
        super.configureListView()
        
        setupCollectionView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.categoriesSub
            .asObserver()
            .map { [SectionModel(model: (), items: $0)] }
            .bind(to: self.commandCollectionView.rx.items(dataSource: getCagegoriesDataSource()))
            .disposed(by: bag)
        
        viewModel.fetchData()
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let categoryCellSpacing: CGFloat = 16
        let width = (collectionView.frame.width - (categoryCellSpacing * 3) - (collectionView.layoutMargins.right + collectionView.layoutMargins.left)) / 4
        let height = width + 26
        return CGSize(width: width, height: height)
    }
}

extension HomeVC {
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 24, left: 16, bottom: 24, right: 16)
        commandCollectionView.setCollectionViewLayout(layout, animated: true)
        
        let nib = UINib(nibName: HomeCollectionViewCell.identifier, bundle: nil)
        commandCollectionView.register(nib, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        
        onItemSelected()
        
        commandCollectionView.delegate = self
        
        commandCollectionView.showsVerticalScrollIndicator = false
    }
    
    private func onItemSelected() {
        commandCollectionView
            .rx
            .modelSelected(Category.self)
            .subscribe(onNext: { item in
                let vc = CommandVC.instantiate(viewModel: CommandVM(item))
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: bag)
    }
}
