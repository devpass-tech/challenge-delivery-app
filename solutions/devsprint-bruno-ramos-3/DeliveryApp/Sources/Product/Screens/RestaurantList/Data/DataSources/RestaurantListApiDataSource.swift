//
//  RestaurantListApiDataSource.swift
//  DeliveryApp
//
//  Created by Bruno Henrique Costa Ramos on 21/02/22.
//

import Foundation

final class RestaurantListApiDataSource: RestaurantListDataSource {
    
    private let network: NetworkProtocol

    init(network: NetworkProtocol) {
        self.network = network
    }

    func fetchRestaurantList(completion: @escaping (Result<[Restaurant], Error>) -> Void) {
        let restaurantRequest = RestaurantListRequest()

        network.request(networkRequest: restaurantRequest) { (result: Result<[RestaurantResponse], Error>) in
            switch result {
            case .success(let restaurantListResponse):
                let restaurantList = restaurantListResponse.map(Restaurant.init)
                completion(.success(restaurantList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

final class RestaurantListCacheDataSource: RestaurantListDataSource {
    private let restaurantListCache: RestaurantListCaching

    init(restaurantListCache: RestaurantListCaching) {
        self.restaurantListCache = restaurantListCache
    }

    func fetchRestaurantList(completion: @escaping (Result<[Restaurant], Error>) -> Void) {
        let restaurantList = restaurantListCache.getCache()
        completion(.success(restaurantList))
    }
}

protocol RestaurantListCaching {
    func getCache() -> [Restaurant]
    func setCache(restaurants: [Restaurant])
}

final class RestaurantListCache: RestaurantListCaching {
    static let shared = RestaurantListCache()

    private var restaurantList: [Restaurant] = []

    func getCache() -> [Restaurant] {
        restaurantList
    }

    func setCache(restaurants: [Restaurant]) {
        restaurantList.append(contentsOf: restaurants)
    }
}
