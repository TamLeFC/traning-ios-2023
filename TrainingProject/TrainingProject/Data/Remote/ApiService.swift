//
//  ApiService.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import Foundation
import RxSwift

protocol ApiService {
    func getAllMineCrafts() -> Single<[MineCraft]>
}
