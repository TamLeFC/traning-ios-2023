//
//  Repository.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import ObjectMapper

class Repository {
    func getCommands() -> [Category] {
        if let path = Bundle.main.url(forResource: "commands", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let jsonString = String(data: data, encoding: .utf8)
                if let jsonString = jsonString {
                    let response = Mapper<CategoryResponse>().map(JSONString: jsonString)
                    return response?.data ?? []
                    }
            } catch {
                print("Error loading JSON data: \(error)")
            }
        }
        return []
    }
  
    func getSetups() -> [Setup] {
        if let path = Bundle.main.url(forResource: "setup", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let jsonString = String(data: data, encoding: .utf8)
                if let jsonString = jsonString {
                    let response = Mapper<SetupResponse>().map(JSONString: jsonString)
                    return response?.data ?? []
                    }
            } catch {
                print("Error loading JSON data: \(error)")
            }
        }
        return []
    }
}
