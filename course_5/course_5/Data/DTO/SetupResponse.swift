//
//  SetupResponse.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import Foundation

struct SetupResponse: Codable {
    var data: [Setup] = []

    enum Keys: String, CodingKey {
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        data = try container.decode([Setup].self, forKey: .data)
    }
}
