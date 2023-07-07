//
//  Command.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import ObjectMapper

struct Command: Mappable {
    var text: String
    
    var isFavorited: Bool = false
    var isSelect: Bool = false
    
    enum Keys: String, CodingKey {
        case text
    }
    
    init(_ text: String) {
        self.text = text
    }
    
    init?(map: Map) {
        text = ""
    }
    
    mutating func mapping(map: Map) {
        text <- map["text"]
    }
    
    public mutating func setFavorite() {
        isFavorited = !isFavorited
    }
   
}
