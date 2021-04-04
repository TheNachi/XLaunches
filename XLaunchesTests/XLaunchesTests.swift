//
//  XLaunchesTests.swift
//  XLaunchesTests
//
//  Created by Munachimso Ugorji on 04/04/2021.
//

import XCTest
@testable import XLaunches

class LaunchesTableViewModelTests: XCTestCase {
    
    let launchModels = [
        LaunchModel(links: LinksModel(patch: PatchModel(large: "dummyUrl1")), success: true, details: "dummy details", date_utc: "2018-12-12", upcoming: true, flight_number: 1, rocket: "a dummy rocket"),
        LaunchModel(links: LinksModel(patch: PatchModel(large: "dummyUrl2")), success: false, details: "dummy details", date_utc: "2017-12-12", upcoming: false, flight_number: 2, rocket: "a dummy rocket"),
        LaunchModel(links: LinksModel(patch: PatchModel(large: "dummyUrl3")), success: false, details: "dummy details", date_utc: "2016-12-12", upcoming: true, flight_number: 3, rocket: "a dummy rocket"),
        LaunchModel(links: LinksModel(patch: PatchModel(large: "dummyUrl4")), success: true, details: "dummy details", date_utc: "2020-12-12", upcoming: true, flight_number: 4, rocket: "a dummy rocket"),
        LaunchModel(links: LinksModel(patch: PatchModel(large: "dummyUrl5")), success: true, details: "dummy details", date_utc: "2022-12-12", upcoming: false, flight_number: 5, rocket: "a dummy rocket"),
        LaunchModel(links: LinksModel(patch: PatchModel(large: "dummyUrl6")), success: false, details: "dummy details", date_utc: "2021-12-12", upcoming: false, flight_number: 6, rocket: "a dummy rocket")
    ]
    
    func testIsSuccessfulOrUpcoming() {
        let viewModel = LaunchesTableViewModel()
        
        XCTAssertTrue(viewModel.isSuccessfulOrUpcoming(launch: launchModels[0]))
        XCTAssertFalse(viewModel.isSuccessfulOrUpcoming(launch: launchModels[1]))
        XCTAssertFalse(viewModel.isSuccessfulOrUpcoming(launch: launchModels[2]))
        XCTAssertTrue(viewModel.isSuccessfulOrUpcoming(launch: launchModels[3]))
        XCTAssertTrue(viewModel.isSuccessfulOrUpcoming(launch: launchModels[4]))
        XCTAssertFalse(viewModel.isSuccessfulOrUpcoming(launch: launchModels[5]))
    }

}
