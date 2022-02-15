//
//  SampleViewController.swift
//  DeliveryApp
//
//  Created by Bruno Henrique Costa Ramos on 14/02/22.
//

import UIKit

protocol SampleDisplayLogic {

}

final class SampleViewController: UIViewController {
    private let customView: SampleViewProtocol
    private let service: SampleServiceProtocol

    init(customView: SampleViewProtocol, service: SampleServiceProtocol) {
        self.customView = customView
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SampleViewController: SampleDisplayLogic {

}

extension SampleViewController: SampleViewDelegate {
    func didTapOnSomeButton() {

    }
}
