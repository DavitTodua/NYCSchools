//
//  MainPageRouter.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/7/23.
//

import UIKit

protocol MainPageRouter {
    func goToDetailsPage(id: String, schoolMainData: SchoolStruct)
}

class MainPageRouterImp: MainPageRouter {
    
    private weak var controller: UIViewController?
    
    init(_ controller: MainPageViewController) {
        self.controller = controller
    }
    
    func goToDetailsPage(id: String, schoolMainData: SchoolStruct) {
        let detailsPageViewController = DetailsPageViewController.instantiate(withConfigurator: DetailsPageConfiguratorImp(id: id, schoolMainData: schoolMainData))
        controller?.navigationController?.pushViewController(detailsPageViewController, animated: true)
    }
}
