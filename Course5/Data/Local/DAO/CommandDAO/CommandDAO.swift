import Realm
import RealmSwift
import RxSwift
import RxRealm

class CommandDAO: BaseDAO {
    func findAll() -> Observable<[Command]> {
        return Observable.deferred {
            let realm = self.realm
            let objs = realm
                .objects(RCommand.self)
            return Observable.array(from: objs)
                .map { $0.map { $0.asModel() } }
                .map { $0.reversed() }
                .observe(on: self.concurrentScheduler)
        }
    }
    
    func find(withContent text: Int) -> Observable<Command?> {
        let predicate = NSPredicate(format: "text == %@", text)
        return Observable.deferred {
            let realm = self.realm
            let obj = realm
                .objects(RCommand.self)
                .filter(predicate)
                .first
            return Observable.from(optional: obj)
                .map { $0.asModel() }
                .observe(on: self.concurrentScheduler)
        }
    }
    
    func save(_ entity: RCommand) -> Observable<Command> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.save(entity).map { $0.asModel() }
        }.observe(on: self.serialScheduler)
    }
    
    func update(_ entity: RCommand) -> Observable<Command> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.save(entity, update: true).map { $0.asModel() }
        }.observe(on: self.serialScheduler)
    }
    
    func delete(_ entity: RCommand) -> Observable<Void> {
        return Observable.deferred {
            return self.realm.rx.delete(entity)
        }.observe(on: self.serialScheduler)
    }
    
    func delete(_ entites: [RCommand]) -> Observable<Void> {
        return Observable.deferred {
            let realm = self.realm
            return realm.rx.delete(entites)
        }.subscribe(on: self.serialScheduler)
    }
    
    func deleteAll() -> Observable<Void> {
        return Observable.deferred {
            self.delete(self.realm
                .objects(RCommand.self)
                .toArray())
        }.observe(on: self.serialScheduler)
    }
}
