//
//  CommandVM.swift
//  course2
//
//  Created by Sơn Lê on 21/05/2023.
//

import RxSwift
import RxCocoa

class CommandVM: BaseVM {
    
    var titleS: PublishSubject<String> = PublishSubject()
    var commandsS: PublishSubject<[Command]> = PublishSubject()
    
    private let category: Category
    
    let favoritedTrigger = PublishRelay<Command>()
    
    init(_ category: Category) {
        self.category = category
        super.init()
        
        trigger
            .asObservable()
            .flatMapLatest { _ -> Observable<[Command]> in
                self.getCommands()
            }
            .subscribe(onNext: {[weak self] cmds in
                guard let self = self else { return }
                self.commandsS.onNext(cmds)
            }, onError: {[weak self] error in
                guard let _ = self else { return }
                //MARK: - handle error
            }).disposed(by: bag)
        
        favoritedTrigger
            .asObservable()
            .flatMapLatest { command -> Observable<Void> in
                if (command.isFavorated) {
                    return self.repository.deleteFavorited(command)
                } else {
                    return self.repository.addFavoriteds(command).map {_ in return () }
                }
            }
            .subscribe(onNext: {[weak self] cmds in
                guard let _ = self else { return }
            }, onError: {[weak self] error in
                guard let _ = self else { return }
                //MARK: - handle error
            }).disposed(by: bag)
    }
    
    func fetchData() {
        trigger.accept(())
        titleS.onNext(category.displayName)
    }
    
    func favoriteChanged(_ item: Command) {
        favoritedTrigger.accept(item)
    }
    
    private func getCommands() -> Observable<[Command]> {
        return repository.getFavoriteds()
            .map { favCommands -> [Command] in
                let favIds = favCommands.map { $0.text }
                return self.category.commands.map { command -> Command in
                    var newItem = command
                    newItem.isFavorated = favIds.contains(command.text)
                    return newItem
                }
            }
    }
}
