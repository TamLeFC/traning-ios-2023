//
//  RAddon.swift
//  Trainning Project
//
//  Created by KietKoy on 18/07/2023.
//

import Foundation
import RealmSwift
import Realm

class RAddon: Object {
    @objc dynamic var itemID: String = ""
    @objc dynamic var itemName: String = ""
    @objc dynamic var thumbUrl: String = ""
    @objc dynamic var authorName: String = ""
    @objc dynamic var descriptionR: String = ""
    @objc dynamic var shortDesciption: String = ""
    @objc dynamic var hotPriority: String = ""
    @objc dynamic var downloadCount: String = ""
    @objc dynamic var isFavorite: Bool = false
    
    override class func primaryKey() -> String? {
        return "itemID"
    }
}

extension RAddon : ModelConvertibleType {
    var uid: String {
        return String(itemID)
    }
    
    func asModel() -> Addon {
        return Addon(itemID, itemName, thumbUrl, authorName, descriptionR, shortDesciption, hotPriority, downloadCount, isFavorite)
    }
}

extension Addon: RealmRepresentable {
    typealias RealmType = RAddon
    
    func asRealm() -> RAddon {
        return Addon.build{
            $0.itemID = itemID
            $0.itemName = itemName
            $0.thumbUrl = thumbUrl
            $0.authorName = authorName
            $0.descriptionR = description
            $0.shortDesciption = shortDescription
            $0.hotPriority = hotPriority
            $0.downloadCount = downloadCount
            $0.isFavorite = isFavorite
        }
    }
}
