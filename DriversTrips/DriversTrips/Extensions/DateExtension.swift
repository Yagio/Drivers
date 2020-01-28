//
//  DateExtension.swift
//  Drivers Trips
//
//  Created by Yarid Zarate on 27/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import Foundation

extension Date {
    func toStringFormat(withFormat format: String = "d MMMM yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
}
