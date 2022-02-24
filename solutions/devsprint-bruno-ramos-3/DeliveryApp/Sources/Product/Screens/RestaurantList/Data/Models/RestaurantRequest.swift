//
//  RestaurantRequest.swift
//  DeliveryApp
//
//  Created by Amaryllis Baldrez on 23/02/22.
//

import Foundation

struct RestaurantListRequest: NetworkRequest {
    
    let urlString: String = "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/home_restaurant_list.json"
    let httpMethod: HTTPMethod = .get
    
    
}
