//
//  DetailVC.swift
//  Course6
//
//  Created by KietKoy on 13/07/2023.
//

import UIKit
import RxSwift
import RxDataSources
import Kingfisher

class DetailVC: BaseVC<DetailVM> {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var knotImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchData()
    }

    @IBAction func backButtonTouched(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.detailKnotS.asObservable()
            .map { [SectionModel(model: (), items: $0.newMedia)] }
            .bind(to: self.collectionView.rx.items(dataSource: getMediaKnotDataSource()))
            .disposed(by: bag)
        
        viewModel.detailKnotS.subscribe {[weak self] detailKnot in
            guard let self = self else { return }
            self.nameLabel.text = detailKnot.element?.title
            self.descriptionLabel.text = detailKnot.element?.description
            loadImage(from: detailKnot.element!.preview, into: self.knotImageView)
        }.disposed(by: bag)
    }
    
    override func configureListView() {
        super.configureListView()
        
        collectionView.delegate = self
        collectionView.registerCellNib(MediaCell.self)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension DetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width:CGFloat = 96
        let height: CGFloat = 96
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
}
