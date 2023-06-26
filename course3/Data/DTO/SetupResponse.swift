//
//  SetupResponse.swift
//  Course2-Alexa
//
//  Created by Tam Le on 17/05/2023.
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
