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
    
    private let urlSessionProtocolStub = URLSessionProtocolStub()
    
    private lazy var networkManager = NetworkManager(urlSession: urlSessionProtocolStub)
    
    func testRequest() {
        let data = Data(base64Encoded: "Isso é um teste")
        urlSessionProtocolStub.completionHandlerToBeReturned = data
        let urlRequest = URLRequest(url: .init(fileURLWithPath: "URL"))
        
//        networkManager.request(urlRequest) { <#Result<Decodable, Error>#> in
//            <#code#>
//        }
    }
}
