import Alamofire
import Moya

enum AppApi {
    case addons
}

extension AppApi: TargetType {
    var baseURL: URL {
        let urlString = Configs.Server.baseURL
        guard let url = URL(string: urlString) else { fatalError("Base URL Invalid") }
        return url
    }
    
    //MARK: -- path
    var path: String {
        switch self {
        case .addons:
            return "get_hot_items_home"
        }
    }
    
    //MARK: -- method
    var method: Alamofire.HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    //MARK: -- sampleData
    var sampleData: Data {
        return Data()
    }
    
    //MARK: -- task
    var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    //MARK: -- headers
    var headers: [String : String]? {
        nil
    }
    
    //MARK: -- Authorization
    var authorizationType: AuthorizationType? {
        switch self {
        default:
            return nil
        }
    }
}
