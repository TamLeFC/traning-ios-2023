//
//  ListKnotResponse.swift
//  course3
//
//  Created by Tam Le on 12/07/2023.
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
