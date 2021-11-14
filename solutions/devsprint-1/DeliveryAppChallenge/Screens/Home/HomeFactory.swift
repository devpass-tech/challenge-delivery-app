//
//  HomeFactory.swift
//  DeliveryAppChallenge
//
//  Created by Bruna Fernanda Drago on 05/11/21.
//

import UIKit

final class HomeFactory: FeatureFactory {
    
    struct Dependencies {}
    
    static func make(with dependecies: Dependencies) -> UIViewController {
        let customView = HomeView()
        let networkManager = NetworkManager()
        let restaurantListDataSource = RestaurantListDataSource(networkManager: networkManager)
        let viewController = HomeViewController(customView: customView, restaurantListDataSource: restaurantListDataSource)
        customView.delegate = viewController
        return viewController
    }
}
