//
//  Driver.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 21/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import Foundation

struct Driver: Codable {
  var id: Int
  var email: String
  var name: String
  var photo: URL
  var mobile: String
  var lastName: String
  
  private enum CodingKeys: String, CodingKey {
    case id
    case email
    case name
    case photo
    case mobile
    case lastName = "last_name"
  }
}
