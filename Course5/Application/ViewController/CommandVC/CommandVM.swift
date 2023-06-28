import RxSwift

class CommandVM: BaseVM {
    
    let category: Category
    
    init(_ category: Category) {
        self.category = category
        super.init()
    }
    
    let commandsSub = PublishSubject<[Command]>()
    
    private let commands: [Command] = []
    
    func fetchData() {
        commandsSub.onNext(category.commands)
    }
}
