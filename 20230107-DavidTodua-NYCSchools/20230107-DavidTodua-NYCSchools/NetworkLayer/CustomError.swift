//
//  CustomError.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/7/23.
//

import Foundation

enum CustomError: Error {
    case failedToCreateRequest
    case failedToDecodeData
}

extension CustomError: LocalizedError {
    public var localizedDescription: String {
        switch self {
        case .failedToCreateRequest: return NSLocalizedString("Unable to create the URLRequest object", comment: "")
        case .failedToDecodeData: return
            NSLocalizedString("Failed To Decode Data", comment: "")
        }
    }
}
