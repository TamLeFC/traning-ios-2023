//
//  ErrorResponse.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import Foundation
import ObjectMapper

struct ErrorResponse: Mappable {
    var message: String?
    var errors: [ErrorModel] = []
    var documentationUrl: String?

    init?(map: Map) {}
    init() {}

    mutating func mapping(map: Map) {
        message <- map["message"]
        errors <- map["errors"]
        documentationUrl <- map["documentation_url"]
    }

    func detail() -> String {
        return errors.map { $0.message ?? "" }
            .joined(separator: "\n")
    }
}

struct ErrorModel: Mappable {
    var code: String?
    var message: String?
    var field: String?
    var resource: String?

    init?(map: Map) {}
    init() {}

    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        field <- map["field"]
        resource <- map["resource"]
    }
}
