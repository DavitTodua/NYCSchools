//
//  DetailsPagePresenter.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/7/23.
//

import Foundation

protocol DetailsPageView: AnyObject {
    var largeTitle: LargeTitleCenterView { get }
    func showErrorView(text: String)
    func hideErrorView()
}

protocol DetailsPagePresenter {
    func viewDidLoad()
    func configurelocationDetailsView(locationView: LabeledSquareView)
    func getParagraphOverview()-> String
    func getTitle() -> String
}

class DetailsPagePresenterImp: DetailsPagePresenter {
    
    private weak var view: DetailsPageView?
    private var router: DetailsPageRouter
    private var restManager: RestManager
    
    private var schoolMainData: SchoolStruct
    private var schoolsDetailedData: [DetailedSchoolData] = []
    private var gradesDetailedData: DetailedSchoolData? = nil
    let id: String
    
    init(view: DetailsPageView, router: DetailsPageRouter, restManager: RestManager, id: String, schoolMainData: SchoolStruct) {
        self.view = view
        self.router = router
        self.id = id
        self.restManager = restManager
        self.schoolMainData = schoolMainData
    }
    
    func viewDidLoad() {
        fetchSchoolDetails()
    }
    
    func fetchSchoolDetails() {
        restManager.makeRequest(toEndPoint: NYCSchoolsEndpoint.getSchoolDetails, withHttpMethod: .get) { result in
            
            if let error = result.error {
                DispatchQueue.main.async {
                    self.view?.showErrorView(text: error.localizedDescription)
                }
            }
            
            if let data = result.data {
                let jsonData = try? JSONDecoder().decode(DetailedSchoolDataResults.self, from: data)
                
                self.schoolsDetailedData = jsonData ?? []
                DispatchQueue.main.async {
                    self.view?.hideErrorView()
                    self.findOurSchool()
                }
            }
        }
    }
    
    func findOurSchool() {
        for i in 0..<schoolsDetailedData.count {
            if schoolsDetailedData[i].dbn == id {
                gradesDetailedData = schoolsDetailedData[i]
                schoolsDetailedData = []
                updateGrades()
                return
            }
        }
        
        DispatchQueue.main.async {
            self.view?.showErrorView(text: "Score information is not available")
        }
    }
    
    func updateGrades() {
        view?.largeTitle.configure(
        title: "Average Scores",
        firstText: "Number of test takers: " + (gradesDetailedData?.numOfSatTestTakers ?? "0"),
        secondText: "Critical reading avg score: " + (gradesDetailedData?.satCriticalReadingAvgScore ?? "0"),
        thirdText: "Math avg score: " + (gradesDetailedData?.satMathAvgScore ?? "0"),
        fourthText: "Writing avg score: " + (gradesDetailedData?.satWritingAvgScore ?? "0"),
        backgroundColor: .systemGray4,
        separatorColor: .blue)
    }
    
    func configurelocationDetailsView(locationView: LabeledSquareView) {
        locationView.configure(
            model: .init(
                city: schoolMainData.city,
                borough: schoolMainData.boro,
                address: schoolMainData.primaryAddressLine1,
                zipCode: schoolMainData.zip,
                backgroundColor: .systemGray4,
                textColor: .blue))
    }
    
    func getParagraphOverview()-> String {
        return schoolMainData.overviewParagraph
    }
    
    func getTitle() -> String {
        return schoolMainData.schoolName
    }
}

