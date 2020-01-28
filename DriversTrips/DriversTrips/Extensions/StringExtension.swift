//
//  StringExtension.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 23/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import Foundation

extension String {
    func isEmailFormatted() -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(\\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@([A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?\\.)+[A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?")
        return predicate.evaluate(with: self)
    }
    
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss") -> Date?{

         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = format
         let date = dateFormatter.date(from: self)

         return date

     }
}
