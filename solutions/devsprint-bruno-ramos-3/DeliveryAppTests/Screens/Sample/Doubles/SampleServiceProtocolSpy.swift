//
//  SampleServiceProtocolSpy.swift
//  DeliveryAppTests
//
//  Created by Bruno Henrique Costa Ramos on 15/02/22.
//

import Foundation
@testable import DeliveryApp

final class SampleServiceProtocolSpy: SampleServiceProtocol {

    private(set) var fetchSomeDataCalled = false
    var fetchSomeDataToBeExecuted: Result<[String], Error>?
    func fetchSomeData(completion: @escaping (Result<[String], Error>) -> ()) {
        fetchSomeDataCalled = true

        if let fetchSomeDataToBeExecuted = fetchSomeDataToBeExecuted {
            completion(fetchSomeDataToBeExecuted)
        }
    }
}
