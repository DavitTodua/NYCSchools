//
//  Spacings.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/7/23.
//

import Foundation

public enum Spacing: Int {
    case XS = 4
    case S = 8
    case M = 12
    case L = 16
    case L2 = 18
    case XL = 20
    case XXL = 32
}

public extension Spacing {
    var floatValue: CGFloat {
        return CGFloat(integerLiteral: self.rawValue)
    }
}

