//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

class HomeViewController: UIViewController {

    private let deliveryApi = DeliveryApi()

    private let homeView: HomeView = {

        let homeView = HomeView()
        return homeView
    }()

    init() {
        super.init(nibName: nil, bundle: nil)

        navigationItem.title = "Delivery App 🍕"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {

        navigationController?.navigationBar.prefersLargeTitles = true

        deliveryApi.fetchRestaurants { restaurants in

            DispatchQueue.main.async {

                self.homeView.updateView(with: restaurants)
            }
        }
    }
    
    override func loadView() {
        self.view = homeView
    }
}
