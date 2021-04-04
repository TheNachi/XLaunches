//
//  Date+Extension.swift
//  XLaunches
//
//  Created by Munachimso Ugorji on 04/04/2021.
//

import Foundation

extension Date {
    var yearsFromNow: Int { return Calendar.current.dateComponents([.year], from: self, to: Date()).year ?? 0 }
}
