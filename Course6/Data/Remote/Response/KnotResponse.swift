//
//  HomeVC.swift
//  Course6
//
//  Created by KietKoy on 13/07/2023.
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
