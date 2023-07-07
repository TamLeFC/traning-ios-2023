//
//  Command_OM.swift
//  Course5
//
//  Created by KietKoy on 27/06/2023.
//

import Foundation
import ObjectMapper

struct Command: Mappable {
    var text: String = ""
    var isFavorite: Bool = false
    var isSelect: Bool = false
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        text <- map["text"]
    }
    
    init(_ text: String) {
        self.text = text
    }
}
