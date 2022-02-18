//
//  RestaurantListRequest.swift
//  DeliveryApp
//
//  Created by Amaryllis Baldrez on 16/02/22.
//

import Foundation
import UIKit

struct Restaurant {
    
    private let name: String
    private let category: String
    private let deliveryTime: DeliveryTime
    
    init(from response: RestaurantResponse) {
        self.name = response.name
        self.category = response.category
        self.deliveryTime = .init(from: response.deliveryTime)
    }
}
