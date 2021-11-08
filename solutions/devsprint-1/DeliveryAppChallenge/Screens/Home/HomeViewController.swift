//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

// MARK: - HomeViewController

final class HomeViewController: UIViewController {
    // MARK: Lifecycle

    init(customView: HomeViewProtocol, deliveryApi: DeliveryApiProtocol) {
        self.customView = customView
        self.deliveryApi = deliveryApi
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Delivery App"
    }

    // MARK: Internal

    override func loadView() {
        view = customView
    }

    override func viewDidAppear(_ animated: Bool) {
        fetchRestaurants()
    }

    func fetchRestaurants() {
        deliveryApi.fetchRestaurants { [weak self] result in
            switch result {
                case let .success(restaurants):
                    guard let self = self else { return }
                    self.customView.displayRestaurants(.init(restaurants: restaurants))
                case let .failure(error):
                    // TODO: error handler
                    print("==48===:  error", error)
            }
        }
    }

    // MARK: Private

    private let deliveryApi: DeliveryApiProtocol
    private let customView: HomeViewProtocol
}

// MARK: - HomeViewController

extension HomeViewController: HomeViewDelegate {
}
