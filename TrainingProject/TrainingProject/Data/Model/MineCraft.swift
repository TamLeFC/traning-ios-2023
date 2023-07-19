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
    
    init?(map: ObjectMapper.Map) {}
    
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

