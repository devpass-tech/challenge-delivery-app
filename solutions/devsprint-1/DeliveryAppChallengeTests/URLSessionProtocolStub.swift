//
//  URLSessionProtocolStub.swift
//  DeliveryAppChallengeTests
//
//  Created by Hellen on 05/11/21.
//

import Foundation

class URLSessionProtocolStub: URLSessionProtocol {
    
    var loadDataCalled = false
    
    var loadDataRequestPassed: URLRequest?
    
    var completionHandlerToBeReturned: Data?
    
    func loadData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        loadDataCalled = true
        loadDataRequestPassed = request
        completionHandler(completionHandlerToBeReturned, nil, nil)
    }
}
