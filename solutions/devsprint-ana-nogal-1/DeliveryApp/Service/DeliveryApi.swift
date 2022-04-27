//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

struct DeliveryApi {

    let addressURL = "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/address_search_results.json"
    
    func fetchRestaurants(_ completion: ([String]) -> Void) {

        completion(["Restaurant 1", "Restaurant 2", "Restaurant 3"])
    }

    func getAddresses() {
        print("1")
        if let url = URL(string: addressURL) {
            print("2")
            print(url)
            URLSession.shared.dataTask(with: url) { data, response, error in
//                print("data: :: \(data)")
//                print("response: \(response)")
                if let data = data {
                    do {
                        print("3")
                        print("Data:: : : : \(data)")
                        let res = try JSONDecoder().decode([Address].self, from: data)
                        print(res)
                    } catch let error {
                        print(error)
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
