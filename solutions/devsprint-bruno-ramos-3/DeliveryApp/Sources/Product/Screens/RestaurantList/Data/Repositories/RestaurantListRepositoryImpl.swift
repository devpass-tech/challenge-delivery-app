//
//  RestaurantListRepositoryImpl.swift
//  DeliveryApp
//
//  Created by Bruno Henrique Costa Ramos on 21/02/22.
//

import Foundation

final class RestaurantListRepositoryImpl: RestaurantListRepository {
    private let primaryDataSource: RestaurantListDataSource
    private let secondaryDataSource: RestaurantListDataSource

    init(
        primaryDataSource: RestaurantListDataSource,
        secondaryDataSource: RestaurantListDataSource
    ) {
        self.primaryDataSource = primaryDataSource
        self.secondaryDataSource = secondaryDataSource
    }

    func fetchRestaurantList(completion: @escaping (Result<[Restaurant], Error>) -> Void) {
        primaryDataSource.fetchRestaurantList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let restaurantList):
                guard restaurantList.isEmpty else {
                    completion(.success(restaurantList))
                    return
                }

                self.secondaryDataSource.fetchRestaurantList(completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
