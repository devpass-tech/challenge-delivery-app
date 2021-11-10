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
    
    var requestToBeReturned: Result<[Any],Error>?
    
    // MARK: - Public Functions
    
    func request<T>(_ request: NetworkRequest, completion: @escaping NetworkResult<T>) where T : Decodable {
        requestCalled = true
        requestPassed = request
        guard let requestToBeReturned = requestToBeReturned, let requestMock = requestToBeReturned as? Result<[T],Error> else {
            return
        }
        
        completion(requestMock)
    }
}
