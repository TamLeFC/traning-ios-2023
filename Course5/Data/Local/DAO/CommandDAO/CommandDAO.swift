//
//  CommandDAO.swift
//  Course5
//
//  Created by KietKoy on 07/07/2023.
//

import Foundation
import Realm
import RealmSwift
import RxRealm
import RxSwift

class CommandDAO: BaseDAO {
    func findAll() -> Observable<[Command]> {
        return Observable.deferred{
            let realm = self.realm
            let objs = realm.objects(Rcommand.self)
            return Observable.array(from: objs)
                .map{ $0.map{ $0.asModel() } }
                .map{ $0.reversed() }
                .observe(on: self.concurrentScheduler)
        }
    }
    
    func find(withContent text: String) -> Observable<Command?> {
        let predicate = NSPredicate(format: "text == %@", text)
        return Observable.deferred{
            let realm = self.realm
            let obj = realm
                .objects(Rcommand.self)
                .filter(predicate)
                .first
            return Observable.from(optional: obj)
                .map{ $0.asModel() }
                .observe(on: self.concurrentScheduler)
        }
    }
    
    func save(_ entity: Rcommand) -> Observable<Command> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.save(entity)
                .map{ $0.asModel() }
                .observe(on: self.serialScheduler)
        }
    }
    
    func update(_ entity: Rcommand) -> Observable<Command> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.save(entity, update: true)
                .map{ $0.asModel() }
                .observe(on: self.serialScheduler)
        }
    }
    
    func delete(_ entities: [Rcommand]) -> Observable<Void> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.delete(entities)
                .observe(on: self.serialScheduler)
        }
    }
    
    func delete(_ entity: Rcommand) -> Observable<Void> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.delete(entity)
                .observe(on: self.serialScheduler)
        }
    }
    
    func deleteAll() -> Observable<Void> {
        return Observable.deferred{
            self.delete(self.realm
                .objects(Rcommand.self)
                .toArray()
            )
        }
        .observe(on: self.serialScheduler)
    }
}
