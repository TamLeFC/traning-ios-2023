//
//  DetailKnot.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import ObjectMapper

struct DetailKnot: Mappable {
    
    var id: String = ""
    var title: String = ""
    var description: String = ""
    var preview: String = ""
    var newMedia: [String] = []
    
    init?(map: ObjectMapper.Map) {
    
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        id <- map["_id"]
        title <- map["title"]
        description <- map["description"]
        preview <- map["preview"]
        newMedia <- map["newMedia"]
    }
    
}
