//
//  CardDetailVM.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import RxSwift
import RxCocoa

class CardDetailVM: BaseVM {
    
    let knotS = PublishSubject<DetailKnot>()
    let mediaS = PublishSubject<[String]>()
    
    private let knot: Knot
    
    init(_ knot: Knot) {
        self.knot = knot
        super.init()
        
        trigger
            .asObservable()
            .flatMapLatest { [unowned self] _ -> Observable<DetailKnot> in
                return self.repository.getKnotDetail(knot.id)
                    .map{ $0.data.first! }
                    .asObservable()
            }
            .subscribe(onNext: { [weak self] knot in
                guard let self = self else { return }
                self.knotS.onNext(knot)
                let mediaURLs = knot.newMedia
                self.mediaS.onNext(mediaURLs)
            }).disposed(by: bag)
    }
}
