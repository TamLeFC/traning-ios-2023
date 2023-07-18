//
//  RespositoryImp.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import Foundation
import RxCocoa
import RxSwift

class RepositoryImp: Repository {
    static let shared = RepositoryImp()
    let apiService: ApiService = ApiServiceImp()
    
    func getListAddon() -> Single<[Addon]> {
        return apiService.getListAddon()
    }
}
