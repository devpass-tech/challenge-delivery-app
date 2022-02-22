//
//  RestaurantListViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class RestaurantListViewController: UIViewController {

    private let getRestaurantList: GetRestaurantListUseCase

    init(getRestaurantList: GetRestaurantListUseCase) {
        self.getRestaurantList = getRestaurantList
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Restaurant List"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getRestaurantList.execute { [weak self] result in
            switch result {
            case .success(let restaurantList):
                print("display view")
//                self.customView.display(viewModel: restaurantList)
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
        self.view = RestaurantListView()
    }
}
