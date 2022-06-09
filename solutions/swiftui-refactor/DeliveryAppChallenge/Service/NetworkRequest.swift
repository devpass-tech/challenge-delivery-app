//
//  NetworkRequest.swift
//  DeliveryAppChallenge
//
//  Created by Hellen on 03/11/21.
//

import Foundation

protocol NetworkRequest {
    
    var baseURL: String { get }
    
    var pathURL: String { get }
    
    var method: HTTPMethod { get }
}

enum HTTPMethod: String {
    case get = "GET"
}

extension NetworkRequest {
    
    var baseURL: String {
        "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/"
    }
}
