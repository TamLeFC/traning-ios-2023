//
//  ApiServiceImp.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import Foundation
import RxSwift
import Moya

final class ApiServiceImp: ApiService {

    var appNetwork: AppNetwork = AppNetworkImp()
    
    func getListAddon() -> RxSwift.Single<[Addon]> {
        return appNetwork.requestArray(.getListAddon, type: Addon.self)
    }
}
