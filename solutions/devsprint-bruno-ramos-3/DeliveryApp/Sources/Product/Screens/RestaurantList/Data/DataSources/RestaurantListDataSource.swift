//
//  RestaurantListDataSource.swift
//  DeliveryApp
//
//  Created by Bruno Henrique Costa Ramos on 21/02/22.
//

import Foundation

protocol RestaurantListDataSource {
    func fetchRestaurantList(completion: @escaping (Result<[Restaurant], Error>) -> Void)
}
