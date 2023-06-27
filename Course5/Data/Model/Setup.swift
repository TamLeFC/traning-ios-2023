//
//  Setup.swift
//  Course5
//
//  Created by KietKoy on 27/06/2023.
//

import Foundation

struct Setup: Codable {
    var type: String  = ""
    var title: String = ""
    var icon: String = ""
    var background: String = ""
    var steps: String = ""
    enum Keys: String, CodingKey {
        case type
        case title
        case icon
        case background
        case steps
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.title = try container.decode(String.self, forKey: .title)
        self.icon = try container.decode(String.self, forKey: .icon)
        self.background = try container.decode(String.self, forKey: .background)
        self.steps = try container.decode(String.self, forKey: .steps)
    }
}
