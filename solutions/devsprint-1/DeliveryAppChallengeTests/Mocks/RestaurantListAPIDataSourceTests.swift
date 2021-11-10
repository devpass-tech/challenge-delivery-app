//
//  RestaurantListAPIDataSourceTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Bruna Fernanda Drago on 10/11/21.
//

import Foundation
import XCTest
@testable import DeliveryAppChallenge

class RestaurantListAPIDataSourceTests: XCTestCase {
    
    private let networkManagerStub = NetworkManagerProtocolStub()
    
    /// sut (subject under test pattern)
    private lazy var sut = RestaurantListAPIDataSource(networkManager: networkManagerStub)
    
    func test_fetchRestaurantList_() {

        networkManagerStub.requestToBeReturned = .success([RestaurantListResponse(name: "RestaurantTest", category: "test", deliveryTime: DeliveryTime(min: 10, max: 15))])
        var result: Result<[RestaurantListResponse],Error>?
        sut.fetchRestaurantList {
            result = $0
            
        }
        switch result {
        case .success(let restaurantList):
            XCTAssertFalse(restaurantList.isEmpty)
        default:
            XCTFail("Should always be succeed")
        }
        XCTAssertTrue(networkManagerStub.requestCalled)
        XCTAssertNotNil(networkManagerStub.requestPassed as? RestaurantListRequest)
    }
}



//func fetchRestaurantList(completion: @escaping RestaurantListResult) {
//    networkManager.request(RestaurantListRequest()) { (result: Result<[RestaurantListResponse],Error>) in
//        switch result {
//        case .success(let restaurantList):
//            completion(.success(restaurantList))
//        case .failure(let error):
//            completion(.failure(error))
//        }
//    }
//}



