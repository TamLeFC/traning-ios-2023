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
    
    func asModel() -> MineCraft {
        return MineCraft(itemId: itemId,
                         itemName: itemName,
                         imageURL: imageURL,
                         thumbURL: thumbURL,
                         authorName: authorName,
                         shortDescription: shortDescription,
                         hotPriority: hotPriority,
                         downloadCount: downloadCount)
    }
}

extension MineCraft: RealmRepresentable {
    typealias RealmType = RFavoriteMineCraft
    
    func asRealm() -> RFavoriteMineCraft {
        return MineCraft.build {
            $0.itemId = itemId
            $0.itemName = itemName
            $0.imageURL = imageURL
            $0.thumbURL = thumbURL
            $0.authorName = authorName
            $0.shortDescription = shortDescription
            $0.hotPriority = hotPriority
            $0.downloadCount = downloadCount
        }
    }
}
