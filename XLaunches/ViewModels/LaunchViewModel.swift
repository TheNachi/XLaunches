//
//  LaunchViewModel.swift
//  XLaunches
//
//  Created by Munachimso Ugorji on 04/04/2021.
//

import Foundation

struct LaunchViewModel {
    let imageString: String?
    let launchNumber: String
    let date: String
    let details: String
    let upcoming: Bool
    let rocketId: String
    
    init(with model: LaunchModel) {
        self.imageString = model.links.patch.large
        self.launchNumber = String(model.flight_number)
        self.date = model.date_utc.dateYearStringConversation()
        self.details = model.details ?? "NO DETAIL!"
        self.upcoming = model.upcoming
        self.rocketId = model.rocket
    }
}
