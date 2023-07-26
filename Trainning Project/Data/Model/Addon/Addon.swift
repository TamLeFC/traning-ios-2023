//
//  Addon.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import ObjectMapper

struct Addon: Mappable {
    var itemID: String           = ""
    var itemName: String         = ""
    var thumbUrl: String         = ""
    var authorName: String       = ""
    var description: String      = ""
    var shortDescription: String = ""
    var hotPriority: String      = ""
    var downloadCount: String    = ""
    var isFavorite: Bool = false
    
    init?(map: Map) {
        
    }
    
    init(_ itemID: String,
         _ itemName: String,
         _ thumbUrl: String,
         _ authorName: String,
         _ description: String,
         _ shortDescription: String,
         _ hotPriority: String,
         _ downloadCount: String,
         _ isFavorite: Bool) {
        self.itemID             = itemID
        self.itemName           = itemName
        self.thumbUrl           = thumbUrl
        self.authorName         = authorName
        self.description        = description
        self.shortDescription   = shortDescription
        self.hotPriority        = hotPriority
        self.downloadCount      = downloadCount
        self.isFavorite         = isFavorite
        
    }
    
    mutating func mapping(map: Map) {
        itemID              <- map["item_id"]
        itemName            <- map["item_name"]
        thumbUrl            <- map["thumb_url"]
        authorName          <- map["author_name"]
        description         <- map["description"]
        shortDescription    <- map["short_description"]
        hotPriority         <- map["hot_priority"]
        downloadCount       <- map["download_count"]
    }
    
    
}
