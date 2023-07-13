//
//  Repository.swift
//  Course2-Alexa
//
//  Created by Tam Le on 16/05/2023.
//

import Foundation
import RxSwift

protocol Repository {
    func getKnots() -> Single<ListKnotResponse>
}
