//
//  LoadImage.swift
//  Course6
//
//  Created by KietKoy on 13/07/2023.
//

import Foundation
import UIKit
import Kingfisher

func loadImage(from imagePath: String, into imageView: UIImageView) {
    imageView.kf.setImage(with: URL(string: imagePath))
}
