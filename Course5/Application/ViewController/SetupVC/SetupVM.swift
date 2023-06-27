class SetupVM {
    var setups: [Setup] = []
    
    private let repository = SetupRepository()
    
    init() {
        setups = repository.getSetups()
    }
}
