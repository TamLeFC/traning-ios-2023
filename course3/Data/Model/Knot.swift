//
//  Taxon.swift
//  course3
//
//  Created by Tam Le on 12/07/2023.
//

import ObjectMapper

struct Knot: Mappable {
    var id: String = ""
    var title: String = ""
    var preview: String = ""
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["_id"]
        title <- map["title"]
        preview <- map["preview"]
    }
}

