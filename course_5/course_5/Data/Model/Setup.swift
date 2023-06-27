//
//  Setup.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import ObjectMapper

struct Setup: Mappable {
    var type: String = ""
    var title: String = ""
    var icon: String = ""
    var background: String = ""
    var steps: String = ""
    
    init?(map: Map){}
    
    mutating func mapping(map: Map) {
        type <- map["type"]
        title <- map["title"]
        icon <- map["icon"]
        background <- map["background"]
        steps <- map["steps"]
    }
}
