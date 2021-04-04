//
//  LaunchModel.swift
//  XLaunches
//
//  Created by Munachimso Ugorji on 04/04/2021.
//

import Foundation

struct LaunchModel: Decodable {
    let links: LinksModel
    let success: Bool?
    let details: String?
    let date_utc: String
    let upcoming: Bool
    let flight_number: Int
    let rocket: String
}

struct LinksModel: Decodable {
    let patch: PatchModel
}

struct PatchModel: Decodable {
    let large: String?
}
