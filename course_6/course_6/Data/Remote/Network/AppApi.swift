//
//  AppApi.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import Alamofire
import Moya

enum AppApi {
    case knots
    case detailKnot(id: String)
}

extension AppApi: TargetType {
    
    var baseURL: URL {
        let urlString = Configs.Server.baseURL
        guard let url = URL(string: urlString) else { fatalError("Base URL Invalid")}
        return url
    }
    
    var path: String {
        switch self {
        case .knots:
            return "knots"
        case .detailKnot(let id):
            return "knots/\(id)"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var authorizationType: AuthorizationType? {
        switch self {
        default:
            return nil
        }
    }
    
}
