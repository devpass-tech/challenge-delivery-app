//
//  URLSessionProtocolStub.swift
//  DeliveryAppChallengeTests
//
//  Created by Hellen on 05/11/21.
//

import Foundation
@testable import DeliveryAppChallenge

final class URLSessionProtocolStub: URLSessionProtocol {
    
    private(set) var loadDataCalled = false
    private(set) var loadDataRequestPassed: URLRequest?
    var completionToBeExecuted: (data: Data?, response: URLResponse?, error: Error?)?

    func loadData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        loadDataCalled = true
        loadDataRequestPassed = request

        completionHandler(completionToBeExecuted?.data, completionToBeExecuted?.response, completionToBeExecuted?.error)
    }
}
