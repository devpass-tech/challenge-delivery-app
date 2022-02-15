//
//  SampleConfigurator.swift
//  DeliveryApp
//
//  Created by Bruno Henrique Costa Ramos on 14/02/22.
//

import UIKit

final class SampleConfigurator: FeatureFactory {
    func make() -> UIViewController {
        let view = SampleView()
        let apiDataSource = DeliveryApi()
        let service = SampleService(apiDataSource: apiDataSource)
        let viewController = SampleViewController(
            customView: view,
            service: service
        )

        view.delegate = viewController

        return viewController
    }
}

protocol FeatureFactory {
    func make() -> UIViewController
}
