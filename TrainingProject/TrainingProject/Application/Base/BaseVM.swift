//
//  BaseVM.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import Foundation
import RxSwift
import RxCocoa

class BaseVM {

    let bag = DisposeBag()
    let repository = RepositoryImp()
    
    let trigger = PublishRelay<Void>()
    
    deinit {
        print("deinit :: >>>> \(String(describing: self)) <<<<")
    }
}
