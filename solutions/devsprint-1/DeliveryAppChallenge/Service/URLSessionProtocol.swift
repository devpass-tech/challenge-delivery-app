//
//  URLSessionProtocol.swift
//  DeliveryAppChallenge
//
//  Created by Hellen on 03/11/21.
//

import Foundation

protocol URLSessionProtocol {
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {
    
}
