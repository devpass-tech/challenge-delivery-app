//
//  NetworkManagerMocks.swift
//  DeliveryAppChallenge
//
//  Created by Hellen on 08/11/21.
//

import Foundation
@testable import DeliveryAppChallenge

enum NetworkManagerMocks {
    
    // MARK: - Public Properties
    
    struct NetworkRequestFake: NetworkRequest {
        let baseURL: String
        let pathURL: String
        let method: HTTPMethod
    }

    static var urlResponseSuccess: URLResponse? = {
        HTTPURLResponse(
            url: .init(fileURLWithPath: "url"),
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
    }()
    
    static var urlResponseError: URLResponse? = {
        HTTPURLResponse(
            url: .init(fileURLWithPath: "url"),
            statusCode: 404,
            httpVersion: nil,
            headerFields: nil
        )
    }()
    
    static var invaliDdata: Data? {
        """
        {
            "devPass": 0
        }
        """.data(using: .utf8)
    }

    static var data: Data? {
        """
        {
            "devPass": "delivery challenge"
        }
        """.data(using: .utf8)
    }

    struct DecodableFake: Decodable {
        let devPass: String
    }
    
    struct ErrorDummy: Error, Equatable { }
}
