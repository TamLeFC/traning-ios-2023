//
//  Category.swift
//  Course2-Alexa
//
//  Created by Tam Le on 16/05/2023.
//

import Foundation

struct CateogryResponse: Codable {
    var data: [Category] = []
    
    enum Keys: String, CodingKey {
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        data = try container.decode([Category].self, forKey: .data)
    }
}
