//
//  CardDetailVC.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import UIKit
import RxSwift
import RxDataSources
import Kingfisher

class CardDetailVC: BaseVC<CardDetailVM> {
    
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var contentDescriptionLabel: UILabel!
    @IBOutlet weak var photosGaleryLabel: UILabel!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        viewModel.trigger.accept(())
        configureListView()
    }
    
    override func initViews() {
        super.initViews()
    }
    
    override func configureListView() {
        super.configureListView()
        
        navigationController?.navigationBar.isHidden = true
        
        cardNameLabel.font = UIFont(name: "Roboto-Bold", size: 20)
        descriptionLabel.font = UIFont(name: "Roboto-Regular", size: 18)
        photosGaleryLabel.font = UIFont(name: "Roboto-Regular", size: 18)
        contentDescriptionLabel.font = UIFont(name: "Roboto-Bold", size: 13)
        
        mainImageView.layer.cornerRadius = 8
        descriptionView.layer.cornerRadius = 8
        
        navigationController?.navigationBar.isHidden = true
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        imageCollectionView.collectionViewLayout = layout
        imageCollectionView.delegate = self
        
        imageCollectionView.registerCellNib(ImageCell.self)
        imageCollectionView.showsHorizontalScrollIndicator = false
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel?.knotS.asObservable()
            .subscribe(onNext: {[weak self] knot in
                guard let self = self else { return }
                self.cardNameLabel.text = knot.title
                self.contentDescriptionLabel.text = knot.description
                self.mainImageView.kf.setImage(with: URL(string: knot.preview))
            }).disposed(by: bag)
        
        viewModel?.mediaS.asObservable()
            .map{ [SectionModel(model: (), items: $0)] }
            .bind(to: self.imageCollectionView.rx.items(dataSource: getMediasKnotDetailDatasources()))
            .disposed(by: bag)
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension CardDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.height
        return CGSize(width: width, height: width)
    }
}
