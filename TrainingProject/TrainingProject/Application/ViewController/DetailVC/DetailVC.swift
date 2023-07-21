//
//  DetailVC.swift
//  TrainingProject
//
//  Created by Mobile Dev on 18/07/2023.
//

import UIKit
import Kingfisher

class DetailVC: BaseVC<DetailVM> {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var addonDetailView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var nameAuthorLabel: UILabel!
    @IBOutlet weak var hotLabel: UILabel!
    @IBOutlet weak var downloadCountLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var favoriteView: UIView!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var contentInformationLabel: UILabel!
    
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
        
        addonDetailView.layer.cornerRadius = 8
        
        headerView.contentMode = .scaleAspectFill
        favoriteImageView.contentMode = .scaleAspectFill
        favoriteImageView.clipsToBounds = true

        nameLabel.font = UIFont(name: "minecrafter_reg", size: 16)
        authorLabel.font = UIFont(name: "space_grotesk_regular", size: 16)
        nameAuthorLabel.font = UIFont(name: "space_grotesk_medium", size: 16)
        hotLabel.font = UIFont(name: "space_grotesk_medium", size: 14)
        downloadCountLabel.font = UIFont(name: "space_grotesk_bold", size: 14)
        favoriteLabel.font = UIFont(name: "space_grotesk_bold", size: 18)
        informationLabel.font = UIFont(name: "space_grotesk_bold", size: 18)
        contentInformationLabel.font = UIFont(name: "space_grotesk_regular", size: 18)
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel?.mineCraftS.asObservable()
            .subscribe(onNext:  {[weak self] mineCraft in
                guard let self = self else { return }
                
                self.detailImageView.kf.setImage(with: URL(string: mineCraft.imageURL))
                self.nameLabel.text = mineCraft.itemName
                self.nameAuthorLabel.text = mineCraft.authorName
                self.hotLabel.text = mineCraft.hotPriority
                self.downloadCountLabel.text = mineCraft.downloadCount
                self.contentInformationLabel.text = mineCraft.shortDescription
            }).disposed(by: bag)
        
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func favoriteButtontapped(_ sender: Any) {
        
    }

}
	
