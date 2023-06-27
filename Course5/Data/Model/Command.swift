//
//  Command.swift
//  Course5
//
//  Created by KietKoy on 26/06/2023.
//

import Foundation
struct Command: Codable {
    var text: String
    
    enum Keys: String, CodingKey {
        case text
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        text = try container.decode(String.self, forKey: .text)
    }
}
