//
//  ApiServiceImp.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

final class ApiServiceImp: ApiService {
    
    var appNetwork: AppNetwork = AppNetworkImp()
    
    func getAllKnots() -> Single<ListKnotResponse> {
        return appNetwork.requestObject(.knots, type: ListKnotResponse.self)
    }
    
    func getKnotDetail(_ id: String) -> Single<KnotResponse> {
        return appNetwork.requestObject(.detailKnot(id: id), type: KnotResponse.self)
    }
}
