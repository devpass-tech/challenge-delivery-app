//
//  RestaurantDetailsConfigurator.swift
//  DeliveryApp
//
//  Created by Bruno Henrique Costa Ramos on 25/02/22.
//

import UIKit

enum RestaurantDetailsConfigurator {
    struct Dependencies {
        let restaurant: Restaurant
    }

    static func make(dependencies: Dependencies) -> UIViewController {
        RestaurantDetailsViewController()
    }
}
