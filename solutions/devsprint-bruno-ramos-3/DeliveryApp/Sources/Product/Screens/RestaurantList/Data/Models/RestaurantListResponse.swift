//
//  RestaurantListResponse.swift
//  DeliveryApp
//
//  Created by Amaryllis Baldrez on 16/02/22.
//

import Foundation

struct RestaurantResponse: Decodable {
    
    let name: String
    let category: String
    let deliveryTime: DeliveryTime
    
    private enum CodingKeys: String, CodingKey {
        case name, category
        case deliveryTime = "delivery_time"
    }
    
    struct DeliveryTime: Decodable {
        let min: Int
        let max: Int
    }
}
