//
//  Repository.swift
//  Course2-Alexa
//
//  Created by Tam Le on 16/05/2023.
//

import Foundation
import RxSwift

class Repository {
    
    func getCommands() -> Observable<[Category]> {
        if let path = Bundle.main.url(forResource: "commands", withExtension: "json") {
            if let data = try? Data(contentsOf: path) {
                let response = try? JSONDecoder().decode(CateogryResponse.self, from: data)
                return Observable.just(response?.data ?? [])
            }
        }
        return Observable.just([])
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
