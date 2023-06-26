//
//  Category.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import Foundation

struct Category: Codable {
    var name: String = ""
    var displayName: String = ""
    var image: String = ""
    var commands: [Command] = []

    enum Keys: String, CodingKey {
        case name
        case displayName = "display_name"
        case image
        case commands
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        name = try container.decode(String.self, forKey: .name)
        displayName = try container.decode(String.self, forKey: .displayName)
        image = try container.decode(String.self, forKey: .image)
        commands = try container.decode([Command].self, forKey: .commands)
    }
}
