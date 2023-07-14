//
//  Repository.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import Foundation
import RxSwift

protocol Repository {
    
    func getAllKnots() -> Single<ListKnotResponse>
    
    func getKnotDetail(_ id: String) -> Single<KnotResponse>
}
