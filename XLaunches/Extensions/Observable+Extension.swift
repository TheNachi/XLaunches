//
//  Observable+Extension.swift
//  XLaunches
//
//  Created by Munachimso Ugorji on 04/04/2021.
//

import RxCocoa
import RxSwift


extension ObservableType {
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { error in
            return Driver.empty()
        }
    }
}
