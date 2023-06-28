import Foundation
import RxSwift

class Repository {
    
    private init() {}
    
    static let sharedIntance = Repository()
    
    func getCommands() -> Observable<[Category]> {
        guard let path = Bundle.main.url(forResource: "commands", withExtension: "json"),
              let data = try? Data(contentsOf: path),
              let jsonString = String(data: data, encoding: .utf8),
              let response = CommandResponse(JSONString: jsonString)
        else {
            return Observable.just([])
        }
        
        return Observable.just(response.data)
    }
    
    func getSetups() -> Observable<[Setup]> {
        guard let path = Bundle.main.url(forResource: "setup", withExtension: "json"),
              let data = try? Data(contentsOf: path),
              let jsonString = String(data: data, encoding: .utf8),
              let response = SetupResponse(JSONString: jsonString)
        else {
            return Observable.just([])
        }
        
        return Observable.just(response.data)
    }
}
