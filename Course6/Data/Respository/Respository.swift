//
//  Respository.swift
//  Course6
//
//  Created by KietKoy on 13/07/2023.
//

import Foundation
import RxSwift

protocol Repository {
    func getKnots() -> Single<ListKnotResponse>
    
    func getDetailKnot(id: String) -> Single<KnotResponse>
}
