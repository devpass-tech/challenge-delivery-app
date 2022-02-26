//
//  RestaurantListPresenter.swift
//  DeliveryApp
//
//  Created by Bruno Henrique Costa Ramos on 25/02/22.
//

import Foundation

protocol RestaurantListPresentationLogic {
    func presentFetchedRestaurantList(response: RestaurantList.FetchRestaurantList.Response)
}

final class RestaurantListPresenter: RestaurantListPresentationLogic {
    weak var viewController: RestaurantListDisplayLogic?

    func presentFetchedRestaurantList(response: RestaurantList.FetchRestaurantList.Response) {
        switch response {
        case .success(let restaurantList):
            let viewModel = restaurantList.map { restaurant in
                RestaurantListView.ViewModel(
                    restaurant: .init(
                        urlImage: "",
                        name: restaurant.name,
                        category: restaurant.category,
                        deliveryTimeMin: restaurant.deliveryTime.min,
                        deliveryTimeMax: restaurant.deliveryTime.max
                    )
                )
            }
            viewController?.displayRestaurantList(viewModel: .init(restaurantListViewModel: viewModel))
        case .failure(let error):
            viewController?.displayError(error)
        }
    }
}
