class HomeVM {
    var categories: [Category] = []
    
    private let repository = CommandRepository()
    
    init() {
        categories = repository.getCommands()
    }
}
