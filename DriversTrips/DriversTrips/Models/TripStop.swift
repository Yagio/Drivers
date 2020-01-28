//
//  TripStop.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 21/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import Foundation

struct TripStop: Codable {
  var id: Int
  var name: String
  var address: String
  var latitude: String
  var longitude: String
  var departureTime: String?
  var boarding: Bool
  
  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case address
    case latitude
    case longitude
    case departureTime = "departure_time"
    case boarding
  }
}
