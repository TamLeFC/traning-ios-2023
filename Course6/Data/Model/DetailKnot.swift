//
//  KnotDetail.swift
//  Course6
//
//  Created by KietKoy on 13/07/2023.
//

import ObjectMapper

struct DetailKnot: Mappable {
    var id: String = ""
    var _id: String = ""
    var title: String = ""
    var categories: [String] = []
    var description: String = ""
    var video: String = ""
    var preview: String = ""
    var newMedia: [String] = []
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        _id <- map["_id"]
        title <- map["title"]
        categories <- map["categories"]
        description <- map["description"]
        video <- map["video"]
        preview <- map["preview"]
        newMedia <- map["newMedia"]
    }
}
