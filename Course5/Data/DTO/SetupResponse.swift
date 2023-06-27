//
//  SetupResponse_OM.swift
//  Course5
//
//  Created by KietKoy on 27/06/2023.
//

import Foundation
import ObjectMapper
struct SetupResponse: Mappable {
    var data: [Setup] = []
    init?(map: Map) {
        
    }
    mutating func mapping(map: Map) {
        data <- map["data"]
    }
}
