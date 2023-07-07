//
//  Respository.swift
//  Course5
//
//  Created by KietKoy on 26/06/2023.
//

import Foundation
import ObjectMapper
import RxSwift

class Respository {
    
    static let shared = Respository()
    
    private var commandDAO = CommandDAO(config: DBManager.shared().config)
    
    func readJSONFile<T: Mappable>(fileName: String) -> Observable<T> {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: "json") else {
            return Observable.empty()
        }
        
        do {
            let jsonString = try String(contentsOfFile: filePath, encoding: .utf8)
            if let response = Mapper<T>().map(JSONString: jsonString) {
                return Observable.just(response)
            }
        } catch {
            print("error: \(error)")
        }
        
        return Observable.empty()
    }

    func getCategories() -> Observable<[Category]> {
        return readJSONFile(fileName: "commands")
                .map { (categoryResponse: CategoryResponse) -> [Category] in
                    return categoryResponse.data
                }
    }

    func getSetups() -> Observable<[Setup]> {
        return readJSONFile(fileName: "setup")
                .map { (setupResponse: SetupResponse) -> [Setup] in
                    return setupResponse.data
                }
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
