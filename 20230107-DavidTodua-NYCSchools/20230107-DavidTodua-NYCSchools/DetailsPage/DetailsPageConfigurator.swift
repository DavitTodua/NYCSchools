//
//  DetailsPageConfigurator.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/7/23.
//

import Foundation

protocol DetailsPageConfigurator {
    func configure(controller: DetailsPageViewController)
}

class DetailsPageConfiguratorImp: DetailsPageConfigurator {
    
    let id: String
    let schoolMainData: SchoolStruct
    
    init(id: String, schoolMainData: SchoolStruct) {
        self.id = id
        self.schoolMainData = schoolMainData
    }
    
    func configure(controller: DetailsPageViewController) {
        let router = DetailsPageRouterImp(controller: controller)
        let presenter = DetailsPagePresenterImp(
            view: controller,
            router: router,
            restManager: RestManager(),
            id: id,
            schoolMainData: schoolMainData)
        
        controller.presenter = presenter
    }
}
