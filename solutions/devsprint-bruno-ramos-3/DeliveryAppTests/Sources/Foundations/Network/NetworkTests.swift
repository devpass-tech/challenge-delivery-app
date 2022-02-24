//
//  NetworkTests.swift
//  DeliveryAppTests
//
//  Created by Amaryllis Baldrez on 22/02/22.
//

import Foundation
import XCTest
@testable import DeliveryApp

class NetworkTests: XCTestCase {
    private let urlSessionStub = URLSessionProtocolStub()
    private lazy var sut = HTTPClient(session: urlSessionStub)
    typealias NetworkResult = Result<NetworkManagerMocks.DecodableFake, Error>
    
    func test_request_givenInvalidURLString_shouldReturnHTTPClientErrorInvalidURL() throws {
        var result: NetworkResult?
        sut.request(urlString: NetworkManagerMocks.invalidURL) {
            result = $0
        }
        
        XCTAssertFalse(urlSessionStub.fetchDataCalled)
        XCTAssertNil(urlSessionStub.fetchDataUrlPassed)
        
        switch result {
        case .failure(let error):
            let unwrappedError = try XCTUnwrap(error as? HTTPClientError)
            XCTAssertEqual(unwrappedError, .invalidURL)
        default:
            XCTFail("Result should be failer with error")
        }
    }
    
    func test_request_givenValidURL_andSessionReturningError_shouldReturnExpectedError() {
        // Given
        
        urlSessionStub.completionHandlerToBeReturned = (nil, nil, ErrorDummy())
        
        // When
        
        var result: NetworkResult?
        sut.request(urlString: NetworkManagerMocks.validURL) {
            result = $0
        }
        
        // Then
        
        XCTAssertTrue(urlSessionStub.fetchDataCalled)
        XCTAssertNotNil(urlSessionStub.fetchDataUrlPassed)
        
        switch result {
        case .failure(let error):
            XCTAssertNotNil(error as? ErrorDummy)
        default:
            XCTFail("Result should be failer with error")
        }
    }
    
    func test_request_givenValidURL_andRequestReturnNilError_andHTTPResponseIsDiferentFrom200_shouldReturnHTTPClientErrorUnexpectedStatusCode() throws {
        // Given
        
        urlSessionStub.completionHandlerToBeReturned = (nil, NetworkManagerMocks.invalidHTTPResponse, nil)
        
        // When
        
        var result: NetworkResult?
        sut.request(urlString: NetworkManagerMocks.validURL) {
            result = $0
        }
        
        // Then
        
        XCTAssertTrue(urlSessionStub.fetchDataCalled)
        XCTAssertNotNil(urlSessionStub.fetchDataUrlPassed)
        
        switch result {
        case .failure(let error):
            let unwrappedError = try XCTUnwrap(error as? HTTPClientError)
            XCTAssertEqual(unwrappedError, .unexpectedStatusCode)
        default:
            XCTFail("Result should be failure with error")
        }
    }
    
    func test_request_givenValidURL_andRequestReturnNilError_andHTTPResponseIs200_shouldReturnHTTPClientErrorInvalidData() throws {
        // Given
        
        urlSessionStub.completionHandlerToBeReturned = (nil, NetworkManagerMocks.validHTTPResponse, nil)
        
        // When
        
        var result: NetworkResult?
        sut.request(urlString: NetworkManagerMocks.validURL) {
            result = $0
        }
        
        // Then
        
        XCTAssertTrue(urlSessionStub.fetchDataCalled)
        XCTAssertNotNil(urlSessionStub.fetchDataUrlPassed)
        
        switch result {
        case .failure(let error):
            let unwrappedError = try XCTUnwrap(error as? HTTPClientError)
            XCTAssertEqual(unwrappedError, .invalidData)
        default:
            XCTFail("Result should be failer with error")
        }
    }
    
    func test_request_givenValidURL_andRequestReturnNilError_andHTTPResponseIs200_andValidData_shouldReturnSuccessWithValue() {
        
        urlSessionStub.completionHandlerToBeReturned = (NetworkManagerMocks.validData, NetworkManagerMocks.validHTTPResponse, nil)
        
        var result: NetworkResult?
        sut.request(urlString: NetworkManagerMocks.validURL) {
            result = $0
        }
        
        XCTAssertTrue(urlSessionStub.fetchDataCalled)
        XCTAssertNotNil(urlSessionStub.fetchDataUrlPassed)
        
        switch result {
        case .success(let decodableObject):
            XCTAssertEqual(decodableObject.name, "bruno")
            
        default:
            XCTFail("Result should be success with value")
        }
    }
    
    func test_request_givenValidURL_andRequestReturnNilError_andHTTPResponseIs200_andInvalidData_shouldReturnDecodeError() throws {
        
        urlSessionStub.completionHandlerToBeReturned = (NetworkManagerMocks.invalidData, NetworkManagerMocks.validHTTPResponse, nil)
        
        var result: NetworkResult?
        sut.request(urlString: NetworkManagerMocks.validURL) {
            result = $0
        }
        
        XCTAssertTrue(urlSessionStub.fetchDataCalled)
        XCTAssertNotNil(urlSessionStub.fetchDataUrlPassed)
        
        switch result {
        case .failure(let error):
            let unwrappedError = try XCTUnwrap(error as? HTTPClientError)
            XCTAssertEqual(unwrappedError, .decodeError)
            
        default:
            XCTFail("Result should be decoded error without value")
        }
    }
    
}

class URLSessionProtocolStub: URLSessionProtocol {
    
    private(set) var fetchDataCalled = false
    private(set) var fetchDataUrlPassed: URL?
    var completionHandlerToBeReturned: (data: Data?, response: URLResponse?, error: Error?)?
    
    func fetchData(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        fetchDataCalled = true
        fetchDataUrlPassed = url
        completionHandler(completionHandlerToBeReturned?.data, completionHandlerToBeReturned?.response, completionHandlerToBeReturned?.error)
    }
}

class NetworkManagerMocks {
    
    struct DecodableFake: Decodable {
        let name: String
    }
    
    struct ErrorDummy: Error {
        
    }
    
    static var validHTTPResponse = HTTPURLResponse(url: .init(fileURLWithPath: "url"), statusCode: 200, httpVersion: nil, headerFields: nil)
    static var invalidHTTPResponse = HTTPURLResponse(url: .init(fileURLWithPath: "url"), statusCode: 300, httpVersion: nil, headerFields: nil)
    static var validURL = "devpass"
    static var invalidURL = "dévpãss"
    static var validData: Data? = {
         """
        {
            "name": "bruno"
        }
        """.data(using: .utf8)
    }()
    static var invalidData: Data? = {
         """
        {
            "nombre": "bruno"
        }
        """.data(using: .utf8)
    }()
}


