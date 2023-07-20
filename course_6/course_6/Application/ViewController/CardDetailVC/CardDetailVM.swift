//
//  CardDetailVM.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import RxSwift
import RxCocoa

class CardDetailVM: BaseVM {
    
    let knotS = PublishSubject<[DetailKnot]>()
    let mediaS = PublishSubject<[String]>()
    
    private let knot: Knot
    
    init(_ knot: Knot) {
        self.knot = knot
        super.init()
        
        trigger
            .asObservable()
            .flatMapLatest{ _ -> Observable<[DetailKnot]> in
                self.repository.getKnotDetail(knot.id)
                    .map{ $0.data }
                    .asObservable()
            }
            .subscribe(onNext: {[weak self] knots in
                guard let self = self else { return }
                self.knotS.onNext(knots)
                let mediaURLs = knots.flatMap { $0.newMedia }
                self.mediaS.onNext(mediaURLs)
            }, onError: {[weak self] error in
                guard let _ = self else { return }
                //MARK: - handle error
            }).disposed(by: bag)
    }
    
}
