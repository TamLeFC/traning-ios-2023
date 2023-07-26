//
//  File.swift
//  Trainning Project
//
//  Created by KietKoy on 25/07/2023.
//

import NotificationBannerSwift

func showNotificationBanner(title: String, icon: String) {
    let leftView = UIImageView(image: icon.toUIImage)
    let banner = NotificationBanner(title: title, leftView: leftView)
    banner.show()
}
