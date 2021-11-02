//
//  NetworkManager.swift
//  DeliveryAppChallenge
//
//  Created by Hellen on 02/11/21.
//

import Foundation

typealias NetworkResult<T: Decodable> = ((Result<T, APIError>) -> Void)

protocol NetworkManagerProtocol {
    
    static func request<T: Decodable>(url: String, completion: @escaping NetworkResult<T>)
}

class NetworkManager: NetworkManagerProtocol {
    
    static func request<T>(url: String, completion: @escaping NetworkResult<T>) {
        guard let url = URL(string: url) else { return }
        
        let dataTaks = URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data else {
                completion(.failure(.databaseError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
                
            } catch {
                completion(.failure(.decodeError))
            }
        }
        
        dataTaks.resume()
    }
}
