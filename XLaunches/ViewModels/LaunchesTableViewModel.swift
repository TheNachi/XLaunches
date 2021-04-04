//
//  LaunchesTableViewModel.swift
//  XLaunches
//
//  Created by Munachimso Ugorji on 04/04/2021.
//

import Foundation
import RxSwift

final class LaunchesTableViewModel {
    let title = "Launch"

    private let launchService: LaunchServiceProtocol
    
    init(with launchService: LaunchServiceProtocol = LaunchService()) {
        self.launchService = launchService
    }
    
    func fetchLaunchViewModel() -> Observable<[LaunchViewModel]> {
        launchService.fetchLaunch().map{ $0.filter { (launchModel) -> Bool in
            self.isSuccessfulOrUpcoming(launch: launchModel)
        }.map{ LaunchViewModel(with: $0 )}}
    }
    
    func isSuccessfulOrUpcoming(launch: LaunchModel) -> Bool {
        if let launchDate = launch.date_utc.changeToDate(), launchDate.yearsFromNow <= 3 {
            if launch.upcoming {
                return true
            }
            
            if let success = launch.success {
                return success
            }
        }
        return false
    }
}
