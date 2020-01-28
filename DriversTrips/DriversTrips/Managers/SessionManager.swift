//
//  SessionManager.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 21/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import Foundation

class SessionManager: NSObject {
    static var currentUser: UserSession? {
      get {
        let defaults = UserDefaults.standard
        if
          let data = defaults.data(forKey: "jetty-user-session"),
          let user = try? JSONDecoder().decode(UserSession.self, from: data)
        {
          return user
        }
        return nil
      }
      
      set {
        let user = try? JSONEncoder().encode(newValue)
        UserDefaults.standard.set(user, forKey: "jetty-user-session")
      }
    }

    class func deleteUser() {
      UserDefaults.standard.removeObject(forKey: "jetty-user-session")
    }

    static var isUserLogged: Bool {
      return currentUser != nil
    }
}
