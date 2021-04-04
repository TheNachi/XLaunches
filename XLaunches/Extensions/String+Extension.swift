//
//  String+Extension.swift
//  XLaunches
//
//  Created by Munachimso Ugorji on 04/04/2021.
//

import Foundation

extension String {
    
    func dateYearStringConversation() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd, MMM yyyy"

        let stringPrefix = String(self.prefix(10))

        if let date = dateFormatterGet.date(from: stringPrefix) {
            return dateFormatterPrint.string(from: date)
        } else {
            return ""
        }

    }
}
