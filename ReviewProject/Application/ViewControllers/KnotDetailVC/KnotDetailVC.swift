import UIKit
import RxDataSources
import Kingfisher

class KnotDetailVC: BaseVC<KnotDetailVM> {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var newMediaCollectionView: UICollectionView!
    
    @IBAction func onBackButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func configureListView() {
        super.configureListView()
        
        setupCollectionView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.knotS.subscribe {[weak self] knot in
            guard let self = self else { return }
            self.previewImageView.kf.setImage(with: URL(string: knot.element!.preview))
            self.titleLabel.text = knot.element?.title
            self.descriptionLabel.text = knot.element?.description
        }.disposed(by: bag)
        
        viewModel.knotS
            .asObserver()
            .map { [SectionModel(model: (), items: $0.newMedia)] }
            .bind(to: self.newMediaCollectionView.rx.items(dataSource: getNewMediaKnotDataSource()))
            .disposed(by: bag)
        
        viewModel.fetchData()
    }
}

extension KnotDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let size = collectionView.frame.width / 3
            
            return CGSize(width: size, height: size)
    }
    
    
}

extension KnotDetailVC {
    private func setupCollectionView() {
        let nib = UINib(nibName: KnotDetailCollectionViewCell.identifier, bundle: nil)
        newMediaCollectionView.register(nib, forCellWithReuseIdentifier: KnotDetailCollectionViewCell.identifier)
        
        newMediaCollectionView.delegate = self
    }
}
