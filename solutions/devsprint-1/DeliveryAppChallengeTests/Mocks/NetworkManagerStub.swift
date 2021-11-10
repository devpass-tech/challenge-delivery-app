//
//  NetworkManagerStub.swift
//  DeliveryAppChallengeTests
//
//  Created by Bruna Fernanda Drago on 10/11/21.
//

import Foundation
@testable import DeliveryAppChallenge

final class NetworkManagerProtocolStub: NetworkManagerProtocol {
    
    // MARK: - Private Properties
    
    private(set) var requestCalled = false
    
    private(set) var requestPassed: NetworkRequest?
    
    // MARK: - Public Properties
    
    var requestToBeReturned: Any?
    
    // MARK: - Public Functions
    
    func request<T>(_ request: NetworkRequest, completion: @escaping NetworkResult<T>) where T : Decodable {
        requestCalled = true
        requestPassed = request
        
        if let requestToBeReturned = requestToBeReturned,
            let foo = requestToBeReturned as? Result<T, Error> {
            completion(foo)
        }
    }
}
