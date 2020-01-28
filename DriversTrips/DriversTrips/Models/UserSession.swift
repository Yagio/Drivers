//
//  UserSession.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 21/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import Foundation

struct UserSession: Codable {
  var id: Int
  var email: String
  var authToken: String
  var name: String
  var lastName: String
  var mobile: String
  var firebaseToken: String
  
  private enum CodingKeys: String, CodingKey {
    case id
    case email
    case authToken = "auth_token"
    case name
    case lastName = "last_name"
    case mobile
    case firebaseToken = "firebase_token"
  }
}
