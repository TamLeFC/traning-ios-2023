//
//  CollectionViewCellSizeCalculator.swift
//  Trainning Project
//
//  Created by KietKoy on 25/07/2023.
//

import UIKit

class CollectionViewCellSizeCalculator {
    
    static func calculateCellSizeForIphone(in collectionView: UICollectionView) -> CGSize {
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        if UIDevice.current.orientation.isLandscape {
            width = (collectionView.frame.width - 16) / 2
        } else {
            width = collectionView.frame.width
        }
        
        height = (width * 332) / 327
        
        return CGSize(width: width, height: height)
    }
    
    static func calculateCellSizeForIpad(in collectionView: UICollectionView) -> CGSize {
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        if UIDevice.current.orientation.isLandscape {
            width = (UIScreen.main.bounds.width - 24 * 2)/2
            height = width * 0.9
        } else {
            width = min(collectionView.frame.width, UIScreen.main.bounds.width)
            height = width * 0.8
        }
        
        return CGSize(width: width, height: height)
    }
}
