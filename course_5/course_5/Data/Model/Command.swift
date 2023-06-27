//
//  Command.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import ObjectMapper

struct Command: Mappable {
    var text: String
    
    init?(map: Map) {
        text = ""
    }
    
    mutating func mapping(map: Map) {
        text <- map["text"]
    }
   
}
