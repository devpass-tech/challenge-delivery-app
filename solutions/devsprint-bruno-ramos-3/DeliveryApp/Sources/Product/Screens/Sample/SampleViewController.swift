//
//  SampleViewController.swift
//  DeliveryApp
//
//  Created by Bruno Henrique Costa Ramos on 14/02/22.
//

import UIKit

final class SampleViewController: UIViewController {
    private let customView: SampleViewProtocol
    private let service: SampleServiceProtocol

    init(customView: SampleViewProtocol, service: SampleServiceProtocol) {
        self.customView = customView
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = customView
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SampleViewController: SampleViewDelegate {
    func didTapOnSomeButton() {
        service.fetchSomeData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let restaurants):
                self.customView.display(viewModel: [.init(name: restaurants.first ?? "", address: "")])
            case .failure(let error):
                print("")
            }
        }
    }
}
