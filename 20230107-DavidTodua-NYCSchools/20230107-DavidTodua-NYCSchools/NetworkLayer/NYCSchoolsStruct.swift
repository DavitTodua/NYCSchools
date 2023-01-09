//
//  NYCSchools.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/7/23.
//

import Foundation

import Foundation

// MARK: - WelcomeElement
struct SchoolStruct: Codable {
    let dbn: String
    let schoolName, overviewParagraph: String
    let primaryAddressLine1: String
    let city: String
    let zip: String
    let boro: String

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case boro
        case overviewParagraph = "overview_paragraph"

        case primaryAddressLine1 = "primary_address_line_1"
        case city, zip
    }
}

typealias SchoolsResult = [SchoolStruct]
