//
//  RestaurantListInteractor.swift
//  DeliveryApp
//
//  Created by Bruno Henrique Costa Ramos on 25/02/22.
//

import Foundation

protocol RestaurantListBusinessLogic {
    func requestRestaurantList(request: RestaurantList.FetchRestaurantList.Request)
}

protocol RestaurantListDataStore {
    var restaurants: [Restaurant] { get set }
}

final class RestaurantListInteractor: RestaurantListBusinessLogic, RestaurantListDataStore {
    private let presenter: RestaurantListPresentationLogic
    private let getRestaurantList: GetRestaurantListUseCase
    var restaurants: [Restaurant] = []

    init(
        presenter: RestaurantListPresentationLogic,
        getRestaurantList: GetRestaurantListUseCase
    ) {
        self.presenter = presenter
        self.getRestaurantList = getRestaurantList
    }

    func requestRestaurantList(request: RestaurantList.FetchRestaurantList.Request) {
        getRestaurantList.execute { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let restaurantList):
                self.restaurants = restaurantList
                self.presenter.presentFetchedRestaurantList(response: .success(restaurantList))
            case.failure(let error):
                self.presenter.presentFetchedRestaurantList(response: .failure(error))
            }
        }
    }
}
