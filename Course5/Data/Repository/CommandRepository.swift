import Foundation
import ObjectMapper
import RxSwift

class CommandRepository {
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
}
