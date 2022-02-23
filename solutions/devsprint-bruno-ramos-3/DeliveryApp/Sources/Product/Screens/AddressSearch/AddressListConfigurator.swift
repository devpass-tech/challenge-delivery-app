//
//  AddressListConfigurator.swift
//  DeliveryApp
//
//  Created by Daniel Araujo on 16/02/22.
//

import UIKit

enum AddressListConfigurator {
    static func make() -> UIViewController {
        let view = AddressListView()
        let viewController = AddressSearchViewController(
            customView: view
        )
        let fooModel = AddressListView.ViewModel(address: "Rua Bela Cintra, 495 ", name: "Consolação")
        view.display(viewModel: [fooModel,fooModel,fooModel])

        view.delegate = viewController

        return viewController
    }
}
