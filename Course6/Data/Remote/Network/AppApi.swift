import Alamofire
import Moya

enum AppApi {
    case knots
    case detailKnot(id: String)
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
        case .knots:
            return "knots"
        case .detailKnot(let id):
            return "knots/\(id)"
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
