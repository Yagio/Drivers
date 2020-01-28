//
//  Trip.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 21/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import Foundation

struct Trip: Codable {    
  var id: Int
  var name: String
  var price: String
  var date: String
  var time: String
  var driver: Driver
  var vehicle: Vehicle
  var stops: [TripStop]?
  
  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case price
    case date
    case time
    case driver
    case vehicle
    case stops = "trip_stops"
  }
}
