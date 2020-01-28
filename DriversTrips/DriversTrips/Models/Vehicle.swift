//
//  Vehicle.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 21/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import Foundation

struct Vehicle: Codable {
  var id: Int
  var brand: String
  var model: String
  var owner: String
  var plate: String
  var seatsNumber: Int
  var year: String
  var photo: URL
  
  private enum CodingKeys: String, CodingKey {
    case id
    case brand
    case model
    case owner
    case plate
    case seatsNumber = "seats_number"
    case year
    case photo
  }
}
