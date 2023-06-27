//
//  Respository.swift
//  Course5
//
//  Created by KietKoy on 26/06/2023.
//

import Foundation
import ObjectMapper

class Respository {
    func getJsonData<U: Mappable>(fileName: String) -> U? {
        if let filePath = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let jsonString = try String(contentsOfFile: filePath, encoding: .utf8)
                if let response = Mapper<U>().map(JSONString: jsonString) {
                    return response
                }
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    func getCommands() -> [Category] {
        if let response: CategoryResponse = getJsonData(fileName: "commands") {
            return response.data
        }
        return []
    }
    func getSetups() -> [Setup] {
        if let response: SetupResponse = getJsonData(fileName: "setup") {
            return response.data
        }
        return []
    }
}
