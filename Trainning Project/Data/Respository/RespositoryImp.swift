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
    
    private var addonDAO = AddonDAO(config: DBManager.shared().config)
    
    func getListAddon() -> Single<[Addon]> {
        return apiService.getListAddon()
    }
    
    func getFavoriteds() -> Observable<[Addon]> {
        return addonDAO.findAll()
    }
    
    func addFavoriteds(_ addon: Addon) -> RxSwift.Observable<Addon> {
        return addonDAO.save(addon.asRealm())
    }
    
    func deleteFavorited(_ addon: Addon) -> Observable<Void> {
        return addonDAO.delete(addon.asRealm())
    }
}
