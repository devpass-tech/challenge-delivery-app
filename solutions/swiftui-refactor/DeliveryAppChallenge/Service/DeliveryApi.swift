//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

protocol DeliveryApiProtocol {
    
    func fetchRestaurants(_ completion: ([String]) -> Void)
}

struct DeliveryApi: DeliveryApiProtocol {
    
    func fetchRestaurants(_ completion: ([String]) -> Void) {
        completion(["Restaurant 1", "Restaurant 2", "Restaurant 3"])
    }
}
