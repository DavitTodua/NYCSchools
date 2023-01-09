//
//  MainPagePresenter.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/7/23.
//

import Foundation

protocol MainPageView: AnyObject {
    func reloadTableView()
    func showErrorView(text: String)
    func hideErrorView()
}

protocol MainPagePresenter {
    func viewDidLoad()
    func goToDetailsPage(indexPath: IndexPath)
    func schoolsCount() -> Int
    func configureCell(cell: BigTitleTableViewCell, indexPath: IndexPath)
}

class MainPagePresenterImp: MainPagePresenter {
    
    let restManager: RestManager
    private weak var view: MainPageView?
    private var router: MainPageRouter
    
    var schoolsArray: [SchoolStruct] = []
    
    init(view: MainPageView, router: MainPageRouter, restManager: RestManager) {
        self.view = view
        self.restManager = restManager
        self.router = router
    }
    
    func viewDidLoad() {
        fetchNYCSchools()
    }
    
    private func fetchNYCSchools() {
        restManager.makeRequest(toEndPoint: NYCSchoolsEndpoint.getSchools, withHttpMethod: .get) { result in
            
            if let error = result.error {
                DispatchQueue.main.async {
                    self.view?.showErrorView(text: error.localizedDescription)
                }
            }
            
            if let data = result.data {
                let jsonData = try? JSONDecoder().decode(SchoolsResult.self, from: data)
                self.schoolsArray = jsonData ?? []
                
                DispatchQueue.main.async {
                    self.view?.hideErrorView()
                    self.view?.reloadTableView()
                }
            }
        }
    }
    
    func goToDetailsPage(indexPath: IndexPath) {
        let id = schoolsArray[indexPath.row].dbn
        router.goToDetailsPage(id: id, schoolMainData: schoolsArray[indexPath.row])
    }
    
    func configureCell(cell: BigTitleTableViewCell, indexPath: IndexPath) {
        cell.configure(
            title: schoolsArray[indexPath.row].schoolName,
            backgroundColor: .systemGray2, textColor: .white,
            roundCorners: Optional.none)
    }
    
    func schoolsCount() -> Int {
        schoolsArray.count
    }
}

