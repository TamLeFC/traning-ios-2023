//
//  Setup.swift
//  course2
//
//  Created by Sơn Lê on 21/05/2023.
//

import Foundation

struct Setup: Codable {
    var type: String = ""
    var title: String = ""
    var icon: String = ""
    var background: String = ""
    var steps: String = ""
    
    enum Keys: String, CodingKey {
        case type, title, icon, background, steps
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        type = try container.decode(String.self, forKey: .type)
        title = try container.decode(String.self, forKey: .title)
        icon = try container.decode(String.self, forKey: .icon)
        background = try container.decode(String.self, forKey: .background)
        steps = try container.decode(String.self, forKey: .steps)
    }
}
