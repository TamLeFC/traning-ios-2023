//
//  Repository.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import ObjectMapper
import RxSwift

class Repository {
    
    private var commandDAO = CommandDAO(config: DBManager.shared().config)
    
    func getCategories() -> Observable<[Category]> {
        if let path = Bundle.main.url(forResource: "commands", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let jsonString = String(data: data, encoding: .utf8)
                if let jsonString = jsonString {
                    let response = Mapper<CategoryResponse>().map(JSONString: jsonString)
                    return Observable.just(response?.data ?? [])
                    }
            } catch {
                print("Error loading JSON data: \(error)")
            }
        }
        return Observable.just([])
    }
  
    func getSetups() -> Observable<[Setup]> {
        if let path = Bundle.main.url(forResource: "setup", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let jsonString = String(data: data, encoding: .utf8)
                if let jsonString = jsonString {
                    let response = Mapper<SetupResponse>().map(JSONString: jsonString)
                    return Observable.just(response?.data ?? [])
                    }
            } catch {
                print("Error loading JSON data: \(error)")
            }
        }
        return Observable.just([])
    }
    
    func getFavoriteds() -> Observable<[Command]> {
        return commandDAO.findAll()
    }
    
    func addFavoriteds(_ command: Command) -> RxSwift.Observable<Command> {
        return commandDAO.save(command.asRealm())
    }
    
    func deleteFavorited(_ command: Command) -> Observable<Void> {
        return commandDAO.delete(command.asRealm())
    }
}
