////
////  RestaurantListAPIDataSourceTests.swift
////  DeliveryAppChallengeTests
////
////  Created by Bruna Fernanda Drago on 10/11/21.
////
//
// import Foundation
// import XCTest
// @testable import DeliveryAppChallenge
//
// class RestaurantListDataSourceTests: XCTestCase {
//
//    private let networkManagerStub = NetworkManagerProtocolStub()
//
//    /// sut (subject under test pattern)
//    private lazy var sut = RestaurantListDataSource(networkManager: networkManagerStub)
//
//    func test_fetchRestaurantList_givenSuccessResponse_shouldSucceed() throws {
//        //Given
//        networkManagerStub.requestToBeReturned = Result<[RestaurantListResponse], Error>.success([RestaurantListResponse(name: "RestaurantTest", category: "test", deliveryTime: DeliveryTime(min: 10, max: 15))])
//
//        var result: Result<[RestaurantListResponse],Error>?
//
//        // When or Act
//        sut.fetchRestaurantList {
//            result = $0
//        }
//
//        //Then or Assert
//        XCTAssertTrue(networkManagerStub.requestCalled)
//        XCTAssertNotNil(networkManagerStub.requestPassed as? RestaurantListRequest)
//        let restaurantList = try XCTUnwrap(result?.get())
//        XCTAssertFalse(restaurantList.isEmpty)
//        XCTAssertNotEqual(restaurantList.first?.name, "McDonalds")
//    }
//
//    func test_fetchRestaurantList_givenFailureResponse_shouldReturnFailure() throws {
//        //Given
//        networkManagerStub.requestToBeReturned = Result<[RestaurantListResponse], Error>.failure(NetworkingError.networkError)
//
//        var result: Result<[RestaurantListResponse],Error>?
//
//        // When or Act
//        sut.fetchRestaurantList {
//            result = $0
//        }
//
//        //Then or Assert
//        XCTAssertTrue(networkManagerStub.requestCalled)
//        XCTAssertNotNil(networkManagerStub.requestPassed as? RestaurantListRequest)
//
//        guard case .failure(let error) = result else {
//            return XCTFail("Should be failure")
//        }
//
//        let networkError = try XCTUnwrap(error as? NetworkingError)
//        XCTAssertEqual(networkError, .networkError)
//    }
// }
//
//
//
//
