//
//  URLSessionProtocol.swift
//  DeliveryAppChallenge
//
//  Created by Hellen on 03/11/21.
//

import Foundation

protocol URLSessionProtocol {
    
    func loadData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: URLSessionProtocol {
    
    func loadData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let dataTask = dataTask(with: request, completionHandler: completionHandler)
        
        dataTask.resume()
    }
}
