//
//  RespositoryImp.swift
//  Course6
//
//  Created by KietKoy on 13/07/2023.
//

import Foundation
import RxCocoa
import RxSwift

class RepositoryImp: Repository {
    static let shared = RepositoryImp()
    let apiService: ApiService = ApiServiceImp()
    
    func getKnots() -> Single<ListKnotResponse> {
        return apiService.getKnots()
    }
    
    func getDetailKnot(id: String) -> Single<KnotResponse> {
        return apiService.getKnotDetail(id: id)
    }
}
