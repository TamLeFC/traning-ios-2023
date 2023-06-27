import Foundation
import ObjectMapper

class CommandRepository {
    func getCommands() -> [Category] {
        guard let path = Bundle.main.url(forResource: "commands", withExtension: "json"),
              let data = try? Data(contentsOf: path),
              let jsonString = String(data: data, encoding: .utf8),
              let response = CommandResponse(JSONString: jsonString)
        else {
            return []
        }
        
        return response.data
    }
}
