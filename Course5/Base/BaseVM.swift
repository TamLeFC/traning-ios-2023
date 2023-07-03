//
//  BaseVM.swift
//  course3
//
//  Created by Tam Le on 03/07/2023.
//

import RxSwift
import RxCocoa

class BaseVM {

    let bag = DisposeBag()
    let respository = Respository.shared
    
    let trigger = PublishRelay<Void>()
}
