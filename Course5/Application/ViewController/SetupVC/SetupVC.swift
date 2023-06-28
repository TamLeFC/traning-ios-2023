import UIKit
import RxSwift
import RxDataSources

class SetupVC: BaseVC<SetupVM> {

    @IBOutlet weak var echoDotView: UIView!
    @IBOutlet weak var echoView: UIView!
    @IBOutlet weak var echoPlusView: UIView!
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var groupCollectionView: UICollectionView!
    
    override func initViews() {
        applyItemStyle(to: echoDotView)
        applyItemStyle(to: echoView)
        applyItemStyle(to: echoPlusView)
        applyItemStyle(to: tapView)
    }
    
    override func configureListView() {
        setupCollectionView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.setupsSub
            .asObserver()
            .map { [SectionModel(model: (), items: Array($0.dropFirst(4)))] }
            .bind(to: self.groupCollectionView.rx.items(dataSource: getSetupsDataSource()))
            .disposed(by: bag)
        
        viewModel.fetchData()
    }
}

extension SetupVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let categoryCellSpacing: CGFloat = 12
        let width = (collectionView.frame.width - categoryCellSpacing) / 2
        let height = width / 2
        return CGSize(width: width, height: height)
    }
}

extension SetupVC {
    
    private func applyItemStyle(to view: UIView) {
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor(named: "color_background_shadow")?.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 8)
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 8
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 32, right: 0)
        groupCollectionView.setCollectionViewLayout(layout, animated: true)
        
        let nib = UINib(nibName: SetupCollectionViewCell.identifier, bundle: nil)
        groupCollectionView.register(nib, forCellWithReuseIdentifier: SetupCollectionViewCell.identifier)
        
        groupCollectionView.delegate = self
        
        groupCollectionView.showsVerticalScrollIndicator = false
    }
}
