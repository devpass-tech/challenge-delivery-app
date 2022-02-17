//
//  RestaurantListResponse.swift
//  DeliveryAppChallenge
//
//  Created by Bruna Fernanda Drago on 10/11/21.
//

import Foundation

struct RestaurantListResponse: Decodable {
    
    let name: String
    let category: String
    let deliveryTime: DeliveryTime
    
    private enum CodingKeys: String,CodingKey {
        case name, category
        case deliveryTime = "delivery_time"
    }
    
    struct DeliveryTime: Decodable {
        let min: Int
        let max: Int
    }
}


