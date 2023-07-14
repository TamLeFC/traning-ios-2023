//
//  Knot.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import ObjectMapper

struct Knot: Mappable {
    
    var id: String = ""
    var title: String = ""
    var preview: String = ""
    
    init?(map: ObjectMapper.Map) {
    
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        id <- map["_id"]
        title <- map["title"]
        preview <- map["preview"]
    }
}
