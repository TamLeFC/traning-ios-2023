//
//  MineCraft.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import ObjectMapper

struct MineCraft: Mappable {
    var itemId: String = ""
    var itemName: String = ""
    var imageURL: String = ""
    var thumbURL: String = ""
    var authorName: String = ""
    var shortDescription: String = ""
    var hotPriority: String = ""
    var downloadCount: String = ""
    var isFavorited: Bool = false
    
    init?(map: ObjectMapper.Map) {}
    
    init(itemId: String, itemName: String, imageURL: String, thumbURL: String, authorName: String, shortDescription: String, hotPriority: String, downloadCount: String) {
        self.itemId = itemId
        self.itemName = itemName
        self.imageURL = imageURL
        self.thumbURL = thumbURL
        self.authorName = authorName
        self.shortDescription = shortDescription
        self.hotPriority = hotPriority
        self.downloadCount = downloadCount
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        itemId <- map["item_id"]
        itemName <- map["item_name"]
        imageURL <- map["image_url"]
        thumbURL <- map["thumb_url"]
        authorName <- map["author_name"]
        shortDescription <- map["short_description"]
        hotPriority <- map["hot_priority"]
        downloadCount <- map["download_count"]
    }
}

