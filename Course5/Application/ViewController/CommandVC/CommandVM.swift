import RxSwift

class CommandVM {
    
    let commandsSub = PublishSubject<[Command]>()
    
    private let category: Category? = nil
    
    private let commands: [Command] = []
    
    func fetchData(_ category: Category) {
        commandsSub.onNext(category.commands)
    }
}
