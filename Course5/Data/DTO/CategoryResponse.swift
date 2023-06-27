//
//  CategoryResponse.swift
//  Course5
//
//  Created by KietKoy on 26/06/2023.
//

import Foundation
struct CategoryResponse: Codable {
    var data: [Category] = []
    
    enum Keys: String, CodingKey {
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        data = try container.decode([Category].self, forKey: .data)
    }
}

