//
//  Addon.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import ObjectMapper

struct Addon: Mappable {
//    var itemID: String = ""
//    var typeID: String = ""
//    var categoryID: String = ""
    var itemName: String = ""
//    var fileUrl: String = ""
//    var imageUrl: String = ""
    var thumbUrl: String = ""
    var authorName: String = ""
//    var version: String = ""
//    var size: String = ""
    var description: String = ""
    var shortDescription: String = ""
    var hotPriority: String = ""
    var downloadCount: String = ""
//    var videoCode: String = ""
//    var isVerify: String = ""
//    var createTime: String = ""
//    var price: String = ""
    var isFavorite: Bool = false
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
//        itemID <- map["item_id"]
//        typeID <- map["type_id"]
//        categoryID <- map["category_id"]
        itemName <- map["item_name"]
//        fileUrl <- map["file_url"]
//        imageUrl <- map["image_url"]
        thumbUrl <- map["thumb_url"]
        authorName <- map["author_name"]
//        version <- map["version"]
//        size <- map["size"]
        description <- map["description"]
        shortDescription <- map["short_description"]
        hotPriority <- map["hot_priority"]
        downloadCount <- map["download_count"]
//        videoCode <- map["video_code"]
//        isVerify <- map["is_verify"]
//        createTime <- map["create_time"]
//        price <- map["price"]
    }
}
