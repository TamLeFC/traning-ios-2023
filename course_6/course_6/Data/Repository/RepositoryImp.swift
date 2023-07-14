//
//  RepositoryImp.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import RxSwift
import RxCocoa

class RepositoryImp: Repository {
    
    let apiService: ApiService = ApiServiceImp()
    
    func getAllKnots() -> Single<ListKnotResponse> {
        return apiService.getAllKnots()
    }
    
    func getKnotDetail(_ id: String) -> Single<KnotResponse> {
        return apiService.getKnotDetail(id)
    }
}
