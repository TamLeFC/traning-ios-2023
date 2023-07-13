//
//  RepositoryImp.swift
//  course3
//
//  Created by Tam Le on 12/07/2023.
//

import RxSwift
import RxCocoa

class RepositoryImp: Repository {
    
    let apiService: ApiService = ApiServiceImp()
    
    func getKnots() -> Single<ListKnotResponse> {
        return apiService.getKnots()
    }
}
