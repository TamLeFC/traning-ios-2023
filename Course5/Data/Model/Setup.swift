//
//  Setup_OM.swift
//  Course5
//
//  Created by KietKoy on 27/06/2023.
//

import Foundation
import ObjectMapper

struct Setup: Mappable {
    
    var type: String  = ""
    var title: String = ""
    var icon: String = ""
    var background: String = ""
    var steps: String = ""
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        type <- map["type"]
        title <- map["title"]
        icon <- map["icon"]
        background <- map["background"]
        steps <- map["steps"]
    }
}
