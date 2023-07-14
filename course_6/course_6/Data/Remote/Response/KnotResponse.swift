//
//  KnotResponse.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import ObjectMapper

struct KnotResponse: Mappable {
    
    var data: [DetailKnot] = []
    
    init?(map: ObjectMapper.Map) {

    }
    
    mutating func mapping(map: Map) {
        data <- map["data"]
    }
    
}
