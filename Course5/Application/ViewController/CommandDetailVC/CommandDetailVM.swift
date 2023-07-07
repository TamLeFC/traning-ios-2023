//
//  CommandDetailVM.swift
//  Course5
//
//  Created by KietKoy on 03/07/2023.
//

import Foundation
import RxSwift
import RxCocoa

class CommandDetailVM: BaseVM {
    
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
            }).disposed(by: bag)
        
        favoritedTrigger
            .asObservable()
            .flatMapLatest { command -> Observable<Void> in
                if (command.isFavorite) {
                    return self.respository.deleteFavorited(command)
                } else {
                    return self.respository.addFavoriteds(command).map {_ in return () }
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
        if(category.name == "favorite") {
            return respository.getFavoriteds()
                .map { favCommands -> [Command] in
                    return favCommands.map{ command in
                        var newItem = command
                        newItem.isFavorite = true
                        return newItem
                    }
                }
        } else {
            return respository.getFavoriteds()
                .map { favCommands -> [Command] in
                    let favIds = favCommands.map { $0.text }
                    return self.category.commands.map { command -> Command in
                        var newItem = command
                        newItem.isFavorite = favIds.contains(command.text)
                        return newItem
                    }
                }
        }
    }
}
