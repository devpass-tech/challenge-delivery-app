//
//  RestaurantListRequest.swift
//  DeliveryAppChallenge
//
//  Created by Bruna Fernanda Drago on 10/11/21.
//

import Foundation

struct RestaurantListRequest: NetworkRequest {
    
    var pathURL = "home_restaurant_list.json"
    
    var method: HTTPMethod = .get
}
