//
//  Kônt.swift
//  Course6
//
//  Created by KietKoy on 13/07/2023.
//

import ObjectMapper

struct Knot: Mappable {
    var id: String = ""
    var title: String = ""
    var preview: String = ""
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["_id"]
        title <- map["title"]
        preview <- map["preview"]
    }
}
