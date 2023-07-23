import Foundation
import Alamofire
import Moya

class NetworkConfig: Session {
    static let shared: NetworkConfig = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = Configs.Network.networkTimeout // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = Configs.Network.networkTimeout // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return NetworkConfig(configuration: configuration, startRequestsImmediately: false)
    }()
}
