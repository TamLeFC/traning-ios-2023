//
//  VoiceVM.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import RxSwift
import RxCocoa

class CommandVM: BaseVM {
    
    let titleS: PublishSubject<String> = PublishSubject()
    let commandS: PublishSubject<[Command]> = PublishSubject()
    
    let favoriteCategory = PublishSubject<Category>()
    private var favoriteCommands: [Command] = []
    
    private let category: Category
    
    let favoritedTrigger = PublishRelay<Command>()
    
    init(_ category: Category) {
        self.category = category
        super.init()
        
        trigger.asObservable()
            .flatMapLatest { _ -> Observable<[Command]> in
                self.getCommands()
            }
            .subscribe(onNext: {[weak self] command in
                guard let self = self else { return }
                self.commandS.onNext(command)
            }, onError: {[weak self] error in
                guard let _ = self else { return }
            }).disposed(by: bag)
        
        favoritedTrigger
            .asObservable()
            .flatMapLatest { command -> Observable<Void> in
                if (command.isFavorited) {
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
        if category.displayName == "Favorite" {
            return repository.getFavoriteds()
                .map { favCommands -> [Command] in
                    return favCommands.map { command -> Command in
                        var newItem = command
                        newItem.isFavorited = true
                        return newItem
                    }
                }
        }
        else {
            return repository.getFavoriteds()
                .map { favCommands -> [Command] in
                    let favIds = favCommands.map { $0.text }
                    return self.category.commands.map { command -> Command in
                        var newItem = command
                        newItem.isFavorited = favIds.contains(command.text)
                        return newItem
                    }
                }
        }
    }
}

