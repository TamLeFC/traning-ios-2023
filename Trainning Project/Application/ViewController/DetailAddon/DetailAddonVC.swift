//
//  DetailAddon.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import UIKit
import RxCocoa

class DetailAddonVC: BaseVC<DetailAddonVM> {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var favoriteView: UIView!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleMoreButtonLabel: UILabel!
    
    @IBOutlet weak var thumbImageView: UIImageView!
    
    private var addon: Addon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchData()
    }
    
    override func initViews() {
        super.initViews()
        
        stackView.addTopBorder(with: UIColor(hex: 0x1E1F21), andWidth: 1)
        
        favoriteView.addRightBorder(with: UIColor(hex: 0x979797), andWidth: 1)
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.addonS
            .subscribe(onNext: { [weak self] addon in
                guard let self = self else { return }
                
                self.addon = addon
                
                loadImage(from: addon.thumbUrl, into: self.thumbImageView)
                
                self.itemNameLabel.text = addon.itemName
                self.authorNameLabel.text = addon.authorName
                self.favoriteCountLabel.text = "\(addon.hotPriority)k"
                self.commentCountLabel.text = "\(addon.downloadCount)k"
                self.descriptionLabel.text = addon.shortDescription
                
                let titleText = addon.isFavorite ? "Remove from favorite" : "Add to favorite"
                let titleColor = addon.isFavorite ? UIColor(hex: 0xFF431A) : UIColor(hex: 0xFFB31A)
                
                self.titleMoreButtonLabel.text = titleText
                self.titleMoreButtonLabel.textColor = titleColor
            })
            .disposed(by: bag)
    }
    
    
    @IBAction func onFavoriteChanged(_ sender: UIButton) {
        
        viewModel.favoriteChanged(self.addon)
        
        onFavoriteUpdated()
    }
    
    
    @IBAction func backButtonTouched(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    private func onFavoriteUpdated() {
        addon.isFavorite = !self.addon.isFavorite
        let titleText = addon.isFavorite ? "Remove from favorite" : "Add to favorite"
        let titleColor = addon.isFavorite ? UIColor(hex: 0xFF431A) : UIColor(hex: 0xFFB31A)
        
        self.titleMoreButtonLabel.text = titleText
        self.titleMoreButtonLabel.textColor = titleColor
    }
}
