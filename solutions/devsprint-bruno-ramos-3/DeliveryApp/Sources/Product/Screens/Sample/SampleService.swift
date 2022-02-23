//
//  SampleService.swift
//  DeliveryApp
//
//  Created by Bruno Henrique Costa Ramos on 14/02/22.
//

import Foundation

protocol SampleServiceProtocol {
    func fetchSomeData(completion: @escaping (Result<[String], Error>) -> ())
}

final class SampleService: SampleServiceProtocol {
//    private let apiDataSource: DeliveryApi
//
//    init(apiDataSource: DeliveryApi) {
//        self.apiDataSource = apiDataSource
//    }
//
    func fetchSomeData(completion: @escaping (Result<[String], Error>) -> ()) {
    }
}
