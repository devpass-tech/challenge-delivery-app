//
//  RestaurantListConfigurator.swift
//  DeliveryApp
//
//  Created by Bruno Henrique Costa Ramos on 21/02/22.
//

import Foundation
import UIKit

enum RestaurantListConfigurator {
    static func make() -> UIViewController {
        let networkManager = HTTPClient()
        let apiDataSource = RestaurantListApiDataSource(network: networkManager)
        let cache = RestaurantListCache.shared
        let cacheDataSource = RestaurantListCacheDataSource(restaurantListCache: cache)
        let repository = RestaurantListRepositoryImpl(
            primaryDataSource: cacheDataSource,
            secondaryDataSource: apiDataSource
        )
        let getRestaurantList = GetRestaurantList(repository: repository)

        let presenter = RestaurantListPresenter()

        let interactor = RestaurantListInteractor(
            presenter: presenter,
            getRestaurantList: getRestaurantList
        )

        let router = RestaurantListRouter()
        let view = RestaurantListView()

        let viewController = RestaurantListViewController(
            interactor: interactor,
            router: router,
            customView: view
        )

        router.dataStore = interactor
        presenter.viewController = viewController
        router.viewController = viewController
        view.delegate = viewController

        return viewController
    }
}
