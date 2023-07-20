//
//  Repository.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import Foundation
import RxSwift

protocol Repository {
    
    func getAllMineCrafts() -> Single<MineCraftResponse>
    
}
