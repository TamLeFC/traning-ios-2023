//
//  SetupResponse.swift
//  Course5
//
//  Created by KietKoy on 27/06/2023.
//

import Foundation

struct SetupResponse: Codable {
    var data: [Setup] = []
    enum Keys: String, CodingKey {
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([Setup].self, forKey: .data)
    }
}
