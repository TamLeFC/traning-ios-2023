//
//  FavoriteMineCraftDAO.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import Foundation
import Realm
import RealmSwift
import RxSwift
import RxRealm

class FavoriteMineCraftDAO: BaseDAO {
    func findAll() -> Observable<[RFavoriteMineCraft]> {
        return Observable.deferred {
            let realm = self.realm
            let objs = realm
                .objects(RFavoriteMineCraft.self)
            return Observable.array(from: objs)
                .map { $0.map { $0.asModel() } }
                .map { $0.reversed() }
                .observe(on: self.concurrentScheduler)
        }
    }
    
    func find(withContent itemName: Int) -> Observable<RFavoriteMineCraft?> {
        let predicate = NSPredicate(format: "text == %@", itemName)
        return Observable.deferred {
            let realm = self.realm
            let obj = realm
                .objects(RFavoriteMineCraft.self)
                .filter(predicate)
                .first
            return Observable.from(optional: obj)
                .map { $0.asModel() }
                .observe(on: self.concurrentScheduler)
        }
    }
    
    func save(_ entity: RFavoriteMineCraft) -> Observable<RFavoriteMineCraft> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.save(entity).map { $0.asModel() }
        }.observe(on: self.serialScheduler)
    }
    
    func update(_ entity: RFavoriteMineCraft) -> Observable<RFavoriteMineCraft> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.save(entity, update: true).map { $0.asModel() }
        }.observe(on: self.serialScheduler)
    }
    
    func delete(_ entity: RFavoriteMineCraft) -> Observable<Void> {
        return Observable.deferred {
            return self.realm.rx.delete(entity)
        }.observe(on: self.serialScheduler)
    }
    
    func delete(_ entites: [RFavoriteMineCraft]) -> Observable<Void> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.delete(entites)
        }.subscribe(on: self.serialScheduler)
    }
    
    func deleteAll() -> Observable<Void> {
        return Observable.deferred {
            self.delete(self.realm
                .objects(RFavoriteMineCraft.self)
                .toArray())
        }.observe(on: self.serialScheduler)
    }
}
