//
//  AppApi.swift
//  TrainingProject
//
//  Created by Mobile Dev on 19/07/2023.
//

import Alamofire
import Moya

enum AppApi {
    case mineCraft
}

extension AppApi: TargetType {
    var baseURL: URL {
        let urlString = Configs.Server.baseURL
        guard let url = URL(string: urlString) else { fatalError("Base URL Invalid")}
        return url
    }
    
    var path: String {
        switch self {
        case .mineCraft:
            return "get_hot_items_home"
        } // Add the missing closing brace here
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
