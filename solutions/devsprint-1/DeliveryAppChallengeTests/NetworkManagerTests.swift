//
//  NetworkManagerTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Hellen on 03/11/21.
//

import Foundation
import XCTest
@testable import DeliveryAppChallenge

class NetworkManagerTests: XCTestCase {
    
    private let urlSessionStub = URLSessionProtocolStub()

    /// sut (subject under test pattern)
    private lazy var sut = NetworkManager(urlSession: urlSessionStub)

    typealias RequestResult = Result<NetworkManagerMocks.DecodableFake, Error>

    func test_request_givenDataWithValidJSON_andURLRequestResponse_shouldReturnAValidResultWithRightParameters() throws {
        // Given or Arrange (given when then or trile A 'AAA' patterns)
        let expectedBaseUrl = "anybaseurl.com.br/api/"
        let expectedPathUrl = "anypath.json"
        let expectedMethod = HTTPMethod.get

        let request = NetworkManagerMocks.NetworkRequestFake(baseURL: expectedBaseUrl, pathURL: expectedPathUrl, method: expectedMethod)
        urlSessionStub.completionToBeExecuted = (NetworkManagerMocks.data, NetworkManagerMocks.urlResponseSuccess, nil)

        // When or Act
        var result: RequestResult?
        sut.request(request) {
            result = $0
        }

        // Then or Assert
        XCTAssertNotNil(result)
        let decodableModel = try XCTUnwrap(result?.get())
        XCTAssertEqual(decodableModel.devPass, "delivery challenge")
        XCTAssertTrue(urlSessionStub.loadDataCalled)
        XCTAssertEqual(urlSessionStub.loadDataRequestPassed?.url?.absoluteString, expectedBaseUrl + expectedPathUrl)
        XCTAssertEqual(urlSessionStub.loadDataRequestPassed?.httpMethod, expectedMethod.rawValue)
    }
    
    func test_request_givenNilURLRequestResponse_shouldReturnError() throws {
        // Given or Arrange
        let request = NetworkManagerMocks.NetworkRequestFake(baseURL: "baseurl/", pathURL: "path", method: .get)
        urlSessionStub.completionToBeExecuted = (NetworkManagerMocks.data, nil, nil)

        // When or Act
        var result: RequestResult?
        sut.request(request) {
            result = $0
        }

        // Then or Assert
        switch result {
        case .failure(let error):
            let apiError = try XCTUnwrap(error as? APIError)
            XCTAssertEqual(apiError, .invalidStatusCode)
        default:
            XCTFail("Result should be failure with error")
        }
    }
    
    func test_request_givenIvalidStatusCode_shouldReturnError() throws {
        // Given or Arrange (given when then or trile A 'AAA' patterns)
        let expectedBaseUrl = "anybaseurl.com.br/api/"
        let expectedPathUrl = "anypath.json"
        let expectedMethod = HTTPMethod.get
        
        let request = NetworkManagerMocks.NetworkRequestFake(baseURL: expectedBaseUrl, pathURL: expectedPathUrl, method: expectedMethod)
        urlSessionStub.completionToBeExecuted = (NetworkManagerMocks.data, NetworkManagerMocks.urlResponseError, nil)
        
        // When or Act
        var result: RequestResult?
        sut.request(request) {
            result = $0
        }
        
        // Then or Assert
        switch result {
        case .failure(let error):
            let apiError = try XCTUnwrap(error as? APIError)
            XCTAssertEqual(apiError, .invalidStatusCode)
        default:
            XCTFail("Result should be failure with error")
        }
    }
    
//    func test_request_DatabaseError_shouldReturnError() throws {
//        // Given or Arrange (given when then or trile A 'AAA' patterns)
//        let expectedBaseUrl = "anybaseurl.com.br/api/"
//        let expectedPathUrl = "anypath.json"
//        let expectedMethod = HTTPMethod.get
//        
//        let request = NetworkManagerMocks.NetworkRequestFake(baseURL: expectedBaseUrl, pathURL: expectedPathUrl, method: expectedMethod)
//        urlSessionStub.completionToBeExecuted = (NetworkManagerMocks.data, NetworkManagerMocks.urlResponseSuccess, nil)
//        
//        // When or Act
//        var result: RequestResult?
//        sut.request(request) {
//            result = $0
//        }
//        
//        // Then or Assert
//        switch result {
//        case .failure(let error):
//            let apiError = try XCTUnwrap(error as? APIError)
//            XCTAssertEqual(apiError, .noData)
//            let decodableModel = try XCTUnwrap(result?.get())
//            XCTAssertNotEqual(decodableModel.devPass, "delivery")
//            XCTAssertTrue(urlSessionStub.loadDataCalled)
//        default:
//            XCTFail("Result should be failure with error")
//        }
//    }
    
    func test_request_givenDataWithValidJSON_andURLRequestResponse_shouldReturnError() throws {
        // Given or Arrange (given when then or trile A 'AAA' patterns)
        let expectedBaseUrl = "anybaseurl.com.br/api/"
        let expectedPathUrl = "anypath.json"
        let expectedMethod = HTTPMethod.get
        
        let request = NetworkManagerMocks.NetworkRequestFake(baseURL: expectedBaseUrl, pathURL: expectedPathUrl, method: expectedMethod)
        urlSessionStub.completionToBeExecuted = (NetworkManagerMocks.data, NetworkManagerMocks.urlResponseSuccess, nil)
        
        // When or Act
        var result: RequestResult?
        sut.request(request) {
            result = $0
        }
        
        // Then or Assert
        switch result {
        case .failure(let error):
            let apiError = try XCTUnwrap(error as? APIError)
            XCTAssertEqual(apiError, .decodeError)
        case .success(_):
            let decodableModel = try XCTUnwrap(result?.get())
            XCTAssertNotEqual(decodableModel.devPass, "Dado invalido")
            XCTAssertTrue(urlSessionStub.loadDataCalled)
        case .none:
            break
        }
    }
}
