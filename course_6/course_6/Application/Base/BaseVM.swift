//
//  BaseVM.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import Foundation

import RxSwift
import RxCocoa

class BaseVM {

    let bag = DisposeBag()
    let repository: Repository = RepositoryImp()
    
    let trigger = PublishRelay<Void>()
    
    deinit {
        print("deinit :: >>>> \(String(describing: self)) <<<<")
    }
}
