//
//  Restaurant.swift
//  DeliveryAppChallenge
//
//  Created by Dairan on 08/11/21.
//

import Foundation

// MARK: - Restaurant

struct Restaurant: Codable {
    let name: String
    let category: String
    let deliveryTime: DeliveryTime
}

// MARK: - DeliveryTime

struct DeliveryTime: Codable {
    var min: Int
    let max: Int
}
