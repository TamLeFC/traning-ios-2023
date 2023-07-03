import UIKit
import RxSwift

public func example(of description: String, action: () -> Void) {
    print("\n--- Example of:", description, "---")
    action()
}

//example(of: "just, of, from") {
//    // 1
//    let one = 1
//    let two = 2
//    let three = 3
//    // 2
//    let _: Observable<Int> = Observable<Int>.just(one)
//    let observable2 = Observable.of(one, two, three)
//    // Tạo một observable kiểu mảng
//    let observable3 = Observable.of([one, two, three])
//    // Toán tử from nhận vào một mảng nhưng tạo ra các Observable riêng lẻ theo từng phần tử
//    let observable4 = Observable.from([one, two, three])
//}
//
//example(of: "subscribe") {
//    let one = 1
//    let two = 2
//    let three = 3
//    let observable = Observable.of(one, two, three)
//    observable.subscribe(onNext: { element in
//        print(element)
//    })
//}
//
//example(of: "empty") {
//    let observable = Observable<Void>.empty()
//    observable
//        .subscribe(
//            // 1
//            onNext: { element in
//                print(element)
//            },
//            // 2
//            onCompleted: {
//                print("Completed")
//            } )
//}
//
//example(of: "never") {
//    let observable = Observable<Any>.never()
//    observable
//        .subscribe(
//            onNext: { element in
//                print(element)
//            },
//            onCompleted: {
//                print("Completed")
//            }
//        ) }
//
//example(of: "range") {
//    // 1
//    let observable = Observable<Int>.range(start: 1, count: 10)
//    observable
//        .subscribe(onNext: { i in
//            let n = Double(i)
//            let fibonacci = Int(((pow(1.61803, n) - pow(0.61803, n)) /
//                                 2.23606).rounded())
//            print(fibonacci)
//        })
//}
//
//example(of: "dispose") {
//    let observable = Observable.of("A", "B", "C")
//    let disposeBag = DisposeBag()
//    observable.subscribe { event in
//        print(event)
//    }
//    .disposed(by: disposeBag)
//}

//example(of: "create") {
//
//    enum MyError: Error {
//        case anError
//    }
//
//    let dispose = DisposeBag()
//
//    Observable.create{observer in
//        observer.onNext("1")
//        observer.onError(MyError.anError)
//        observer.onCompleted()
//        observer.onNext("?")
//        return Disposables.create()
//    }.subscribe(
//        onNext: {print($0)},
//        onError: {print($0)},
//        onCompleted: {print("completed")},
//        onDisposed: {print("disposed")}
//    ).disposed(by: dispose)
//}

//example(of: "deferred") {
//    let disposedBag = DisposeBag()
//
//    var flip = false
//
//    let factory: Observable<Int> = Observable.deferred{
//        flip = !flip
//        if flip {
//            return Observable.of(1, 2, 3)
//        } else {
//            return Observable.of(4, 5, 6)
//        }
//    }
//
//    for _ in 0...3 {
//        factory.subscribe(onNext: {
//            print($0, terminator: "")
//        })
//        .disposed(by: disposedBag)
//        print()
//    }
//}
example(of: "PublishSubject") {
    let subject = PublishSubject<String>()
    subject.onNext("Co ai nghe tui noi khong?")
    let subscriptionOne = subject
        .subscribe(onNext: { string in
            print("1) " + string)
        })
    subject.on(.next("1"))
    
    // Add subscription two
    let subscriptionTwo = subject
        .subscribe { event in
            print("2)", event.element ?? event)
        }
    
    subscriptionOne.dispose()
    subject.onNext("4")
    
    // 1
    subject.onCompleted()
    // 2
    subject.onNext("5")
    // 3
    subscriptionTwo.dispose()
    let disposeBag = DisposeBag()
    // 4
    subject
        .subscribe {
            print("3)", $0.element ?? $0)
        }.disposed(by: disposeBag)
    subject
        .subscribe{
            print("4)", $0.element ?? $0)
        }
        .disposed(by: disposeBag)
    subject.onNext("?")
}
