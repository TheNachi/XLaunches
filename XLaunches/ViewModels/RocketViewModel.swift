//
//  RocketViewModel.swift
//  XLaunches
//
//  Created by Munachimso Ugorji on 04/04/2021.
//

import Foundation
import RxSwift

final class RocketViewModel {
    let title = "Rocket"
    
    public var rocket = PublishSubject<RocketModel>()
    private var rocketService: RocketServiceProtocol
    let disposeBag = DisposeBag()
    
    init(with rocketService: RocketServiceProtocol = RocketService()) {
        self.rocketService = rocketService
    }
    
    func fetchRocketModel(with id: String) {
        rocketService.fetchRocket(with: id).subscribe(onNext: { rocket in
            self.rocket.onNext(rocket)
        }).disposed(by: disposeBag)
    }
    
    func driveRocket(onNext: ((RocketModel) -> Void)?) {
        return rocket.asDriverOnErrorJustComplete().drive(onNext: onNext).disposed(by: disposeBag)
    }
    
}
