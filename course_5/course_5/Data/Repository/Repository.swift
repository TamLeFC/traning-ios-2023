//
//  Repository.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import Foundation

class Repository {
    
    func getCommands() -> [Category] {
        if let path = Bundle.main.url(forResource: "commands", withExtension: "json") {
            if let data = try? Data(contentsOf: path) {
                let response = try? JSONDecoder().decode(CateogryResponse.self, from: data)
                return response?.data ?? []
            }
        }
        return []
    }
    
    func getSetups() -> [Setup] {
        if let path = Bundle.main.url(forResource: "setup", withExtension: "json") {
            if let data = try? Data(contentsOf: path) {
                let response = try? JSONDecoder().decode(SetupResponse.self, from: data)
                return response?.data ?? []
            }
        }
        return []
    }
}
