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
    private var mineCraftDAO = FavoriteMineCraftDAO(config: DBManager.shared().config)
    
    func getAllMineCrafts() -> RxSwift.Single<[MineCraft]> {
        return apiService.getAllMineCrafts()
    }
    
    func getFavoriteds() -> Observable<[MineCraft]> {
        return mineCraftDAO.findAll()
    }
    
    func addFavoriteds(_ mineCraft: MineCraft) -> RxSwift.Observable<MineCraft> {
        return mineCraftDAO.save(mineCraft.asRealm())
    }
    
    func deleteFavorited(_ mineCraft: MineCraft) -> Observable<Void> {
        return mineCraftDAO.delete(mineCraft.asRealm())
    }}
