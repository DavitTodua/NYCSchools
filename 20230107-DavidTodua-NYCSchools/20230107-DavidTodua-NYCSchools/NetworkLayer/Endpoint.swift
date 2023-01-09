//
//  Endpoint.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/7/23.
//

import Foundation

protocol Endpoint {
    //HTTP OR HTTPS
    var scheme: String { get }
    
    //rickandmortyapi.com
    var baseURL: String { get }
    
    // charactes/id/
    var path: String { get }
    
    // name: "apikey", value : API_KEY
    var parameters: [URLQueryItem] { get }
    
}


