//
//  Command.swift
//  course2
//
//  Created by Sơn Lê on 19/05/2023.
//

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
