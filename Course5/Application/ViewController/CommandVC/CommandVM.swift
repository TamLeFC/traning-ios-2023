class CommandVM {
    
    let category: Category
    let commands: [Command]
    
    init(_ category: Category) {
        self.category = category
        self.commands = category.commands
    }
}
