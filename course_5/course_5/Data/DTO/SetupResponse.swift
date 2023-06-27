//
//  SetupResponse.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import ObjectMapper

struct SetupResponse: Mappable {
    var data: [Setup] = []

    init?(map: Map){}
    
    mutating func mapping(map: Map) {
        data <- map["data"]
    }
}
