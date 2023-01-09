//
//  MainPageConfigurator.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/7/23.
//

import Foundation

protocol MainPageConfigurator {
    func configure(_ controller: MainPageViewController)
}

class MainPageConfiguratorImp: MainPageConfigurator {
    func configure(_ controller: MainPageViewController) {
        let router = MainPageRouterImp(controller)
        
        let presenter = MainPagePresenterImp(
            view: controller,
            router: router,
            restManager: RestManager())
        
        controller.presenter = presenter
    }
}
