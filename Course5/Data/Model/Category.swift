//
//  Category_OM.swift
//  Course5
//
//  Created by KietKoy on 27/06/2023.
//

import Foundation
import ObjectMapper
struct Category: Mappable {
    var name: String = ""
    var displayName: String = ""
    var image: String = ""
    var commands: [Command] = []
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        displayName <- map["display_name"]
        image <- map["image"]
        commands <- map["commands"]
    }
}
