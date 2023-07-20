//
//  ApiServiceImp.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

final class ApiServiceImp: ApiService {
    var appNetwork: AppNetwork = AppNetworkImp()
    
    func getAllMineCrafts() -> RxSwift.Single<[MineCraft]> {
        return appNetwork.requestArray(.mineCraft, type: MineCraft.self)
    }
}
