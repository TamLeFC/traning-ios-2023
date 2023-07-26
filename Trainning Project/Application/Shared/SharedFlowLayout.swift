//
//  SharedFlowLayout.swift
//  Trainning Project
//
//  Created by KietKoy on 25/07/2023.
//

import UIKit

class SharedFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        scrollDirection = .vertical
        sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
}
