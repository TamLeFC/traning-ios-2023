//
//  Respository.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import RxSwift

protocol Repository {
    func getListAddon() -> Single<[Addon]>
    
    func getFavoriteds() -> Observable<[Addon]>
    
    func addFavoriteds(_ addon: Addon) -> Observable<Addon>
    
    func deleteFavorited(_ addon: Addon) -> Observable<Void>
}
