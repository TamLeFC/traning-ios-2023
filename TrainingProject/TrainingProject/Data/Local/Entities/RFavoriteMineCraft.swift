//
//  RFavoriteMineCraft.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import Foundation
import RealmSwift
import Realm

class RFavoriteMineCraft: Object {
    @objc dynamic var itemId: String = ""
    @objc dynamic var itemName: String = ""
    @objc dynamic var imageURL: String = ""
    @objc dynamic var thumbURL: String = ""
    @objc dynamic var authorName: String = ""
    @objc dynamic var shortDescription: String = ""
    @objc dynamic var hotPriority: String = ""
    @objc dynamic var downloadCount: String = ""
    
    override class func primaryKey() -> String? {
        return "itemId"
    }
}

extension RFavoriteMineCraft: ModelConvertibleType {
    
    var uid: String {
        return String(itemId)
    }
    
    func asModel() -> RFavoriteMineCraft {
        return self
    }
}

extension RFavoriteMineCraft: RealmRepresentable {
    typealias RealmType = RFavoriteMineCraft
    
    func asRealm() -> RFavoriteMineCraft {
        return RFavoriteMineCraft.build {
            $0.itemId = itemId
            func asRealm() -> RFavoriteMineCraft {
                let realmObject = RFavoriteMineCraft()
                realmObject.itemId = itemId
                realmObject.itemName = itemName
                realmObject.imageURL = imageURL
                realmObject.thumbURL = thumbURL
                realmObject.authorName = authorName
                realmObject.shortDescription = shortDescription
                realmObject.hotPriority = hotPriority
                realmObject.downloadCount = downloadCount
                return realmObject
            }
        }
    }
}
