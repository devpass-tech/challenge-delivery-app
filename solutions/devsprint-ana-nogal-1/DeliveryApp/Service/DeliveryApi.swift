//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

protocol DeliveryApiProtocol: AnyObject {
    func getAdresses()
    var searchControllerDelegate: AddressSearchViewControllerProtocol? { get set }
}

class DeliveryApi: DeliveryApiProtocol {

    weak var searchControllerDelegate: AddressSearchViewControllerProtocol?

    let addressURL = "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/address_search_results.json"
    
    func fetchRestaurants(_ completion: ([String]) -> Void) {

        completion(["Restaurant 1", "Restaurant 2", "Restaurant 3"])
    }
    
    func getAdresses() {
            if let url = URL(string: addressURL) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            let res = try JSONDecoder().decode([Address].self, from: data)
                            self.searchControllerDelegate?.updateAddress(address: res)
                        } catch let error {
                            print("Error: \(error)")
                        }
                    }
                }.resume()
            }
        }

    func searchAddresses(_ completion: ([String]) -> Void) {

        completion(["Address 1", "Address 2", "Address 3"])
    }

    func fetchRestaurantDetails(_ completion: (String) -> Void) {

        completion("Restaurant Details")
    }
}
