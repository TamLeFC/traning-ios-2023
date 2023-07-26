//
//  DetailVC.swift
//  TrainingProject
//
//  Created by Mobile Dev on 18/07/2023.
//

import UIKit
import Kingfisher

class DetailVC: BaseVC<DetailVM> {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var addonDetailView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var nameAuthorLabel: UILabel!
    @IBOutlet weak var hotLabel: UILabel!
    @IBOutlet weak var downloadCountLabel: UILabel!
    @IBOutlet weak var favoriteView: UIView!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var contentInformationLabel: UILabel!
    
    var onFavoriteChanged: ((MineCraft) -> Void)? = nil
    private var mineCraft: MineCraft!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.trigger.accept(())
    }
    
    override func initViews() {
        super.initViews()
    }
    
    override func configureListView() {
        super.configureListView()
        
        scrollView.contentInsetAdjustmentBehavior = .never
        addonDetailView.layer.cornerRadius = 8
        detailImageView.contentMode = .scaleAspectFill
        
        favoriteImageView.contentMode = .scaleAspectFill
        favoriteImageView.clipsToBounds = true

        nameLabel.font = UIFont(name: "Minecrafter", size: 16)
        authorLabel.font = UIFont(name: "SpaceGrotesk-Regular", size: 16)
        nameAuthorLabel.font = UIFont(name: "SpaceGrotesk-Medium", size: 16)
        hotLabel.font = UIFont(name: "SpaceGrotesk-Medium", size: 14)
        downloadCountLabel.font = UIFont(name: "SpaceGrotesk-Bold", size: 14)
        favoriteLabel.font = UIFont(name: "SpaceGrotesk-Bold", size: 18)
        informationLabel.font = UIFont(name: "SpaceGrotesk-Bold", size: 18)
        contentInformationLabel.font = UIFont(name: "SpaceGrotesk-Regular", size: 18)
        
        let startColor = UIColor(hex: "0B0C0D", alpha: 1)
        let middleColor = UIColor(hex: "0B0C0D", alpha: 0.2)
        let endColor = UIColor(hex: "0B0C0D", alpha: 0)

        let threePointGradientView = ThreePointGradientView(startColor: startColor,
                                                  middleColor: middleColor,
                                                  endColor: endColor)
        threePointGradientView.backgroundColor = .clear
        threePointGradientView.frame = gradientView.bounds
        threePointGradientView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        gradientView.addSubview(threePointGradientView)
        gradientView.sendSubviewToBack(threePointGradientView)

    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel?.mineCraftS.asObservable()
            .subscribe(onNext:  {[weak self] mineCraft in
                guard let self = self else { return }
                self.mineCraft = mineCraft
                self.detailImageView.kf.setImage(with: URL(string: mineCraft.imageURL))
                self.nameLabel.text = mineCraft.itemName
                self.nameAuthorLabel.text = mineCraft.authorName
                self.hotLabel.text = NumberFormatterHelper.formatNumber(mineCraft.hotPriority)
                self.downloadCountLabel.text = NumberFormatterHelper.formatNumber(mineCraft.downloadCount)
                self.contentInformationLabel.text = mineCraft.shortDescription
            }).disposed(by: bag)
        
        viewModel?.checkIsFavorited().subscribe(onNext: { isFavorited in
            if isFavorited {
                self.mineCraft.isFavorited = true
                self.favoriteLabel.text = "Remove from favorite"
                self.favoriteLabel.textColor = UIColor(named: "text_remove")
            } else {
                self.mineCraft.isFavorited = false
                self.favoriteLabel.text = "Add to favorite"
                self.favoriteLabel.textColor = UIColor(named: "text_add")
            }
            }).disposed(by: bag)
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func favoriteButtontapped(_ sender: Any) {
        onFavoriteChanged?(mineCraft)
        viewModel.favoriteTrigger.accept(mineCraft)
    }

}
	
