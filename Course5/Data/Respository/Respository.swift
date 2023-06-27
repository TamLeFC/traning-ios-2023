//
//  Respository.swift
//  Course5
//
//  Created by KietKoy on 26/06/2023.
//

import Foundation

class Respository {
    func getCommands() -> [Category] {
        if let url = Bundle.main.url(forResource: "commands", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(CategoryResponse.self, from: data)
                return jsonData.data
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
    func getSetups() -> [Setup] {
        if let url = Bundle.main.url(forResource: "setup", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(SetupResponse.self, from: data)
                return jsonData.data
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
}
