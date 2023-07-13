//
//  HomeVC.swift
//  Course6
//
//  Created by KietKoy on 13/07/2023.
//

import UIKit
import RxSwift
import RxDataSources

class HomeVC: BaseVC<HomeVM> {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var knots: [Knot] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchData()
    }
    
    override func initViews() {
        super.initViews()
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func configureListView() {
        super.configureListView()
        
        collectionView.delegate = self
        
        collectionView.registerCellNib(KnotCell.self)
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.knotS.asObserver()
            .map { [SectionModel(model: (), items: $0)] }
            .bind(to: self.collectionView.rx.items(dataSource: getKnotsDataSource()))
            .disposed(by: bag)
        
        viewModel.knotS.subscribe { [weak self] knots in
            guard let self = self else { return }
            self.knots = knots
        }.disposed(by: bag)
    }
    
    override func addEventForViews() {
        super.addEventForViews()
        
        collectionView.rx.itemSelected
            .subscribe(onNext: { [unowned self] indexPath in
                let vc = DetailVC.instantiate(viewModel: DetailVM(id: knots[indexPath.row].id))
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: bag)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height: CGFloat = width * 0.33
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
}
