//
//  HTTPClient.swift
//  DeliveryApp
//
//  Created by Amaryllis Baldrez on 17/02/22.
//

import Foundation

protocol NetworkProtocol {
    func request<T: Decodable>(networkRequest: NetworkRequest, completion: @escaping (Result<T, Error>) -> Void)
}

protocol URLSessionProtocol {
    func fetchData(with urlRequest: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

protocol NetworkRequest {
    var urlString: String { get }
    var httpMethod: HTTPMethod { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

extension URLSession: URLSessionProtocol {
    
    func fetchData(with urlRequest: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let dataTask = dataTask(with: urlRequest, completionHandler: completionHandler)
        dataTask.resume()
    }
}

class HTTPClient: NetworkProtocol {
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func request<T: Decodable>(networkRequest: NetworkRequest, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: networkRequest.urlString) else {
            completion(.failure(HTTPClientError.invalidURL))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = networkRequest.httpMethod.rawValue
        session.fetchData(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completion(.failure(HTTPClientError.unexpectedStatusCode))
                return
            }
            guard let data = data else {
                completion(.failure(HTTPClientError.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let objectDecoded = try decoder.decode(T.self, from: data)
                    completion(.success(objectDecoded))
            }
            catch {
                completion(.failure(HTTPClientError.decodeError))
            }
        }
    }
}

enum HTTPClientError: Error {
    case unexpectedStatusCode
    case invalidData
    case decodeError
    case invalidURL
}

