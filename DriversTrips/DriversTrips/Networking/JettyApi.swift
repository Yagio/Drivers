//
//  JettyApi.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 21/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import Foundation

enum FetchError: Error {
  case error(String)
  
  var localizedDescription: String {
      switch self {
      case .error(let message):
          return message
      }
  }
}

class JettyApi {
    open class func login(_ email: String,
               password: String,
               success: @escaping () -> Void,
               failure: @escaping (_ error: FetchError) -> Void) {
        
        let jsonObject: [String: Any] = [
            "driver": [
                "email": email,
                "password": password
            ]
        ]
        
        HTTPHelper.post("https://jettymx-st.herokuapp.com/api/drivers/session", data: jsonObject) { (statusCode, data, error) in
                   
            if error != nil {
                failure(.error("asasdad"))
                return
            }
                   
            if statusCode == 401 {
                failure(.error("Datos Incorrectos"))
                return
            }
            
            if statusCode == 500 {
                failure(.error("Server Error"))
                return
            }
            
            //Save User Session
            SessionManager.currentUser = try? JSONDecoder().decode(UserSession.self, from: data!)
            
            success()
            
        }
    }
    
    open class func getTrips(_ success: @escaping (_ trips: [Trip]) -> Void, failure: @escaping (_ error: FetchError) -> Void) {
        
        let sessionUser = SessionManager.currentUser
        
        let header: [String: String] = [
            "Authorization": "Token \(sessionUser?.authToken ?? ""),email=\(sessionUser?.email ?? "")"
        ]
        
        HTTPHelper.get("https://jettymx-st.herokuapp.com/api/drivers/trips", headers: header ) { (statusCode, data, error) in
                   
            if error != nil {
                failure(.error("Client Error"))
                return
            }
            
            if statusCode == 401 {
                failure(.error("Autorizacion Invalida"))
                return
            }
            
            if statusCode == 500 {
                failure(.error("Server Error"))
                return
            }
                               
            let trips = try? JSONDecoder().decode([Trip].self, from: data!)
            
            success(trips!)
            
        }
    }
}
