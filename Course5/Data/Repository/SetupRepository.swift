import Foundation
import ObjectMapper

class SetupRepository {
    func getSetups() -> [Setup] {
        guard let path = Bundle.main.url(forResource: "setup", withExtension: "json"),
              let data = try? Data(contentsOf: path),
              let jsonString = String(data: data, encoding: .utf8),
              let response = SetupResponse(JSONString: jsonString)
        else {
            return []
        }
        
        return response.data
    }
}

