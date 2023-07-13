//
//  ApiServiceImp.swift
//
//  Created by Tam Le on 09/07/2021.
//  Copyright © 2021 Tam Le. All rights reserved.
//


import Foundation
import RxSwift
import Moya
import ObjectMapper

final class ApiServiceImp: ApiService {

    var appNetwork: AppNetwork = AppNetworkImp()
    
    //MARK: -- Demo
    
    func getKnots() -> Single<ListKnotResponse> {
        return appNetwork.requestObject(.knots, type: ListKnotResponse.self)
    }
    
    //MARK: App

    
}
