////
////  NYCSchoolDetailsStruct.swift
////  20230107-DavidTodua-NYCSchools
////
////  Created by David Todua on 1/7/23.
////

import Foundation

// MARK: - WelcomeElement
struct DetailedSchoolData: Codable {
    let dbn: String
    let schoolName, numOfSatTestTakers, satCriticalReadingAvgScore: String
    let satMathAvgScore, satWritingAvgScore: String

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
}

typealias DetailedSchoolDataResults = [DetailedSchoolData]
