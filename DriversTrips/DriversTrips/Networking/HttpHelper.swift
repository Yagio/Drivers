//
//  HttpRequestHelper.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 21/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import Foundation

class HTTPHelper {
    
    public typealias Response = (Int?, Data?, NSError?) -> Void
    
    fileprivate var request: URLRequest

    public enum Method: String {
        case GET    = "GET"
        case POST   = "POST"
    }
        
    public init(method: Method, url: String, headers: [String: String]?) {
        self.request = URLRequest(url: URL(string: url)!)
        self.request.httpMethod = method.rawValue
        self.request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let headers = headers {
            self.request.allHTTPHeaderFields = headers
        }
    }
                
    open class func get(_ url: String, headers: [String: String]?, done: @escaping Response) -> Void {
        return HTTPHelper(method: .GET, url: url, headers: headers).send(done)
    }
    
    open class func post(_ url: String, data: [String: Any], done: @escaping Response) -> Void {
        return HTTPHelper(method: .POST, url: url, headers: nil).data(data).send(done)
    }
    
    open func data(_ data: [String: Any]) -> HTTPHelper {
        do {
            self.request.httpBody = try JSONSerialization.data(withJSONObject: data, options: [])
        } catch {
            self.request.httpBody = nil
        }
                
        return self
    }
    
    open func send(_ done: @escaping Response) -> Void {
        URLSession.shared.dataTask(with: self.request, completionHandler: { data, response, error in
                        
            let response = response as? HTTPURLResponse
                        
            if let error = error {
                done(response?.statusCode, nil, error as NSError)
                return
            }
            
            done(response?.statusCode, data, nil)
            
        }).resume()
          
    }
}
