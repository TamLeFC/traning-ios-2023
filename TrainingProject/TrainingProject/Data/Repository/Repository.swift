//
//  Repository.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import Foundation
import RxSwift

protocol Repository {
    
    func getAllMineCrafts() -> Single<[MineCraft]>
    
    func getFavoriteds() -> Observable<[MineCraft]>
    
    func addFavoriteds(_ mineCraft: MineCraft) -> RxSwift.Observable<MineCraft>
    
    func deleteFavorited(_ mineCraft: MineCraft) -> Observable<Void>
}
