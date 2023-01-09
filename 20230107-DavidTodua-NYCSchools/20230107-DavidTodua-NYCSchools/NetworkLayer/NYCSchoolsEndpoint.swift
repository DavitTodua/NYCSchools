//
//  NYCSchoolsEndpoint.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/7/23.
//

import Foundation

enum NYCSchoolsEndpoint: Endpoint {
    
    case getSchools
    case getSchoolDetails

    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "data.cityofnewyork.us"
        }

    }
    
    var path: String {
        switch self {
        case .getSchools:
            return "/resource/s3k6-pzi2.json"
        case .getSchoolDetails:
            return "/resource/f9bf-2cp4.json"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        default:
            return []
        }
    }
    
    
}
