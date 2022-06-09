//
//  RestaurantListAPIDataSource.swift
//  DeliveryAppChallenge
//
//  Created by Bruna Fernanda Drago on 10/11/21.
//

import Foundation

typealias RestaurantListResult = (Result<[RestaurantListResponse], Error>) -> Void

protocol RestaurantListDataSourceProtocol {
    
    func fetchRestaurantList(completion: @escaping RestaurantListResult)
}

final class RestaurantListDataSource {
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchRestaurantList(completion: @escaping RestaurantListResult) {
        networkManager.request(RestaurantListRequest()) { (result: Result<[RestaurantListResponse],Error>) in
            switch result {
            case .success(let restaurantList):
                completion(.success(restaurantList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
