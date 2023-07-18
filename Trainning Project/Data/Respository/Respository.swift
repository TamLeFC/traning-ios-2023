//
//  Respository.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import Foundation
import RxSwift

protocol Repository {
    func getListAddon() -> Single<[Addon]>
    
}
