//
//  DeliveryTime.swift
//  DeliveryApp
//
//  Created by Amaryllis Baldrez on 17/02/22.
//

import Foundation

struct DeliveryTime {
    let min: Int
    let max: Int
    
    init(from response: DeliveryTime) {
        self.min = response.min
        self.max = response.max
    }
}
