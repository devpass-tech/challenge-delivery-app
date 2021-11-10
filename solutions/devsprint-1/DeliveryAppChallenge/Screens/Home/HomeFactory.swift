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
        let deliveryApi = DeliveryApi()
        let viewController = HomeViewController(customView: customView, deliveryApi: deliveryApi)
        customView.delegate = viewController
        return viewController
    }
}
