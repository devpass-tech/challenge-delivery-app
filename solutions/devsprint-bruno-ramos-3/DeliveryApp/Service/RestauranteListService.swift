//
//  RestauranteListService.swift
//  DeliveryApp
//
//  Created by Amaryllis Baldrez on 16/02/22.
//

import Foundation

class RestaurantListService {
    private let apiURL = "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/home_restaurant_list.json"
    
    func fetchRestaurants(completion: @escaping ([RestaurantResponse]?, Error?) -> Void) {
            guard let api = URL(string: apiURL) else {
                return
            }
            
            let session = URLSession.shared
            let task = session.dataTask(with: api) { (data, response, error) in
                guard let jsonData = data else {
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode([RestaurantResponse].self, from: jsonData)
                    
                    completion(decoded, nil)
                } catch let error {
                    completion(nil, error)
                }
            }
            
            task.resume()
        }

}
