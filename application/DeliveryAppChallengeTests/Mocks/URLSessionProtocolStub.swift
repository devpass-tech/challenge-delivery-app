//
//  URLSessionProtocolStub.swift
//  DeliveryAppChallengeTests
//
//  Created by Hellen on 05/11/21.
//

@testable import DeliveryAppChallenge
import Foundation

final class URLSessionProtocolStub: URLSessionProtocol {
    // MARK: - Private Properties

    private(set) var loadDataCalled = false

    private(set) var loadDataRequestPassed: URLRequest?

    // MARK: - Public Properties

    var completionToBeExecuted: (data: Data?, response: URLResponse?, error: Error?)?

    // MARK: - Public Functions

    func loadData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        loadDataCalled = true
        loadDataRequestPassed = request

        completionHandler(completionToBeExecuted?.data, completionToBeExecuted?.response, completionToBeExecuted?.error)
    }
}
