//
//  RestaurantListViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

protocol RestaurantListDisplayLogic: AnyObject {
    func displayRestaurantList(viewModel: RestaurantList.FetchRestaurantList.ViewModel)
    func displayError(_ error: Error)
}

class RestaurantListViewController: UIViewController {
    private let interactor: RestaurantListBusinessLogic
    private let router: RestaurantListRoutingLogic
    private let customView: RestaurantListViewProtocol & UIView

    init(
        interactor: RestaurantListBusinessLogic,
        router: RestaurantListRoutingLogic,
        customView: RestaurantListViewProtocol & UIView
    ) {
        self.interactor = interactor
        self.router = router
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Restaurant List"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.requestRestaurantList(request: .init())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = customView
    }
}

extension RestaurantListViewController: RestaurantListDisplayLogic {
    func displayRestaurantList(viewModel: RestaurantList.FetchRestaurantList.ViewModel) {
        customView.display(viewModel: viewModel.restaurantListViewModel)
    }

    func displayError(_ error: Error) {}
}

extension RestaurantListViewController: RestaurantListViewDelegate {
    func didSelectRestaurant(at row: Int) {
        router.routeToRestaurantMenu(at: row)
    }
}
