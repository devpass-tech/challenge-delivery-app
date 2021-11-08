//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

// MARK: - DeliveryApiError

enum DeliveryApiError: Error {
    case invalidURL
    case decodificationError
    case responseError
}

// MARK: - DeliveryApiProtocol

protocol DeliveryApiProtocol {
    func fetchRestaurants(_ completion: @escaping (Result<[Restaurant], DeliveryApiError>) -> Void)
}

// MARK: - DeliveryApi

struct DeliveryApi: DeliveryApiProtocol {
    func fetchRestaurants(_ completion: @escaping (Result<[Restaurant], DeliveryApiError>) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/home_restaurant_list.json") else {
            return completion(.failure(.invalidURL))
        }
        let request = URLRequest(url: url)

        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                // TODO: error handler
                print("==26===:  error", error)
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // TODO: error handler
                return completion(.failure(.responseError))
            }

            guard let data = data else {
                // TODO: error handler
                return completion(.failure(.decodificationError))
            }

            guard let restaurants: [Restaurant] = data.jSONDecode(using: .convertFromSnakeCase) else {
                return completion(.failure(.decodificationError))
            }
            
            DispatchQueue.main.async {
                completion(.success(restaurants))
            }
        }
        task.resume()
    }
}
