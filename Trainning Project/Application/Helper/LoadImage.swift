//
//  LoadImage.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import UIKit
import Kingfisher

func loadImage(from imagePath: String, into imageView: UIImageView) {
    imageView.kf.setImage(with: URL(string: imagePath))
}
