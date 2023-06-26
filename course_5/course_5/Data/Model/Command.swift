//
//  Command.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import Foundation

import Foundation

struct Command: Codable {
    var text: String
    
    var isFavorated: Bool = false
    var isSelect: Bool = false
    
    enum Keys: String, CodingKey {
        case text
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        text = try container.decode(String.self, forKey: .text)
    }
}
