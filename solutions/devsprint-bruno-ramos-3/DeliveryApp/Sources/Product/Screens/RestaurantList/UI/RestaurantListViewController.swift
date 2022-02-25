//
//  RestaurantListViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class RestaurantListViewController: UIViewController {

    private let getRestaurantList: GetRestaurantListUseCase
    private let customView: RestaurantListViewProtocol & UIView

    init(getRestaurantList: GetRestaurantListUseCase, customView: RestaurantListViewProtocol & UIView) {
        self.getRestaurantList = getRestaurantList
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Restaurant List"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getRestaurantList.execute { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let restaurantList):
                let viewModel = restaurantList.map { restaurant in
                    RestaurantListView.ViewModel(restaurant: .init(urlImage: "", name: restaurant.name, category: restaurant.category, deliveryTimeMin: restaurant.deliveryTime.min, deliveryTimeMax: restaurant.deliveryTime.max))
                }
                self.customView.display(viewModel: viewModel)
            case.failure(let error):
//                self.customView.display(error: error)
                print("display error")
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = customView
    }
}
