//
//  RepositoryImp.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import RxSwift
import RxCocoa

class RepositoryImp: Repository {
    let apiService: ApiService = ApiServiceImp()
    
    func getAllMineCrafts() -> RxSwift.Single<[MineCraft]> {
        return apiService.getAllMineCrafts()
    }
}
