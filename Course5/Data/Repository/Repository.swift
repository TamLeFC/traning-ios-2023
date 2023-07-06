import RxSwift

class Repository {
    
    private init() {}
    
    final class func shared() -> Repository {
        return sharedInstance
    }
    
    private static var sharedInstance: Repository = {
        let repository = Repository()
        return repository
    }()
    
    private var commandDAO = CommandDAO(config: DBManager.shared().config)
    
    func getCommands() -> Observable<[Category]> {
        guard let path = Bundle.main.url(forResource: "commands", withExtension: "json"),
              let data = try? Data(contentsOf: path),
              let jsonString = String(data: data, encoding: .utf8),
              let response = CommandResponse(JSONString: jsonString)
        else {
            return Observable.just([])
        }
        
        return Observable.just(response.data)
    }
    
    func getSetups() -> Observable<[Setup]> {
        guard let path = Bundle.main.url(forResource: "setup", withExtension: "json"),
              let data = try? Data(contentsOf: path),
              let jsonString = String(data: data, encoding: .utf8),
              let response = SetupResponse(JSONString: jsonString)
        else {
            return Observable.just([])
        }
        
        return Observable.just(response.data)
    }
    
    func getFavoriteds() -> Observable<[Command]> {
        return commandDAO.findAll()
    }
    
    func addFavoriteds(_ command: Command) -> RxSwift.Observable<Command> {
        return commandDAO.save(command.asRealm())
    }
    
    func deleteFavorited(_ command: Command) -> Observable<Void> {
        return commandDAO.delete(command.asRealm())
    }
}
