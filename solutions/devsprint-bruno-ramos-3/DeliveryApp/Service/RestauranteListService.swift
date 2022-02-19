//
//  RestauranteListService.swift
//  DeliveryApp
//
//  Created by Amaryllis Baldrez on 16/02/22.
//

import Foundation

class RestaurantListService {
    
    private let apiURL = "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/home_restaurant_list.json"
    private let httpClient: NetworkProtocol
    
    init(httpClient: NetworkProtocol) {
        self.httpClient = httpClient
    }
    
    func fetchRestaurants(completion: @escaping (Result<[Restaurant], Error>) -> Void) {
        httpClient.request(urlString: apiURL) { (result: Result<[RestaurantResponse], Error>) in
            switch result {
            case .success(let response):
                let restaurants = response.map(Restaurant.init)
                completion(.success(restaurants))
            case .failure(let error):
                completion(.failure(error))
            }
        }

    }
}
