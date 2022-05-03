//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

protocol DeliveryApiProtocol {
    
    var searchControllerDelegate: AddressSearchViewControllerProtocol? { get set }
    func getAdresses(_ completion: @escaping ([Address]) -> Void)
}

struct DeliveryApi: DeliveryApiProtocol {

    weak var searchControllerDelegate: AddressSearchViewControllerProtocol?

    private let addressURL = "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/address_search_results.json"
    
    func fetchRestaurants(_ completion: ([String]) -> Void) {

        completion(["Restaurant 1", "Restaurant 2", "Restaurant 3"])
    }
    
    func getAdresses(_ completion: @escaping ([Address]) -> Void) {
            if let url = URL(string: addressURL) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            let addresses = try JSONDecoder().decode([Address].self, from: data)
                            completion(addresses)
                        } catch let error {
                            print("Error: \(error)")
                        }
                    }
                }.resume()
            }
        }

    func fetchRestaurantDetails(_ completion: (String) -> Void) {

        completion("Restaurant Details")
    }
}
