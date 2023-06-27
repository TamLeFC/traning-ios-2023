//
//  Respository.swift
//  Course5
//
//  Created by KietKoy on 26/06/2023.
//

import Foundation
import ObjectMapper

class Respository {
    func getCommands() -> [Category] {
        if let filePath = Bundle.main.path(forResource: "commands", ofType: "json") {
            do {
                let jsonString = try String(contentsOfFile: filePath, encoding: .utf8)
                if let categoryResponse = Mapper<CategoryResponse>().map(JSONString: jsonString) {
                    return categoryResponse.data ?? []
                }
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
    func getSetups() -> [Setup] {
        if let filePath = Bundle.main.path(forResource: "setup", ofType: "json") {
            do {
                let jsonString = try String(contentsOfFile: filePath, encoding: .utf8)
                if let categoryResponse = Mapper<SetupResponse>().map(JSONString: jsonString) {
                    return categoryResponse.data ?? []
                }
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
}
