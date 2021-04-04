//
//  RocketModel.swift
//  XLaunches
//
//  Created by Munachimso Ugorji on 04/04/2021.
//

import Foundation

struct RocketModel: Decodable {
    let name: String
    let description: String
    let wikipedia: String
    let flickr_images: [String]
}
