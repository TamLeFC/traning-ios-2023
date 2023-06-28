import Foundation
import ObjectMapper
import RxSwift

class SetupRepository {
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

