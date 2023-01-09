//
//  DetailsPageRouter.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/7/23.
//

import Foundation

protocol DetailsPageRouter {
    
}

class DetailsPageRouterImp: DetailsPageRouter {
    
    weak var controller: DetailsPageViewController?
    
    init(controller: DetailsPageViewController) {
        self.controller =  controller
    }
}
