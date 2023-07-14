//
//  ListKnotResponse.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import ObjectMapper

struct ListKnotResponse: Mappable {
    
    var data: [Knot] = []
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: Map) {
        data <- map["data"]
    }
    
}
