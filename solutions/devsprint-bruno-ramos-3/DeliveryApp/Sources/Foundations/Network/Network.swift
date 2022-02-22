//
//  HTTPClient.swift
//  DeliveryApp
//
//  Created by Amaryllis Baldrez on 17/02/22.
//

import Foundation

protocol NetworkProtocol {
    func request<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, Error>) -> Void)
}

final class NetworkManager: NetworkProtocol {
    func request<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
