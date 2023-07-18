//
//  AddonDAO.swift
//  Trainning Project
//
//  Created by KietKoy on 18/07/2023.
//

import Foundation
import Realm
import RealmSwift
import RxRealm
import RxSwift

class AddonDAO: BaseDAO {
    func findAll() -> Observable<[Addon]> {
        return Observable.deferred{
            let realm = self.realm
            let objs = realm.objects(RAddon.self)
            return Observable.array(from: objs)
                .map{ $0.map{ $0.asModel() } }
                .map{ $0.reversed() }
                .observe(on: self.concurrentScheduler)
        }
    }
    
    func find(withContent text: String) -> Observable<Addon?> {
        let predicate = NSPredicate(format: "text == %@", text)
        return Observable.deferred{
            let realm = self.realm
            let obj = realm
                .objects(RAddon.self)
                .filter(predicate)
                .first
            return Observable.from(optional: obj)
                .map{ $0.asModel() }
                .observe(on: self.concurrentScheduler)
        }
    }
    
    func save(_ entity: RAddon) -> Observable<Addon> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.save(entity)
                .map{ $0.asModel() }
                .observe(on: self.serialScheduler)
        }
    }
    
    func update(_ entity: RAddon) -> Observable<Addon> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.save(entity, update: true)
                .map{ $0.asModel() }
                .observe(on: self.serialScheduler)
        }
    }
    
    func delete(_ entities: [RAddon]) -> Observable<Void> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.delete(entities)
                .observe(on: self.serialScheduler)
        }
    }
    
    func delete(_ entity: RAddon) -> Observable<Void> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.delete(entity)
                .observe(on: self.serialScheduler)
        }
    }
    
    func deleteAll() -> Observable<Void> {
        return Observable.deferred{
            self.delete(self.realm
                .objects(RAddon.self)
                .toArray()
            )
        }
        .observe(on: self.serialScheduler)
    }
}
