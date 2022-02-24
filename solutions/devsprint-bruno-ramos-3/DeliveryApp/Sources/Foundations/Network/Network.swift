//
//  HTTPClient.swift
//  DeliveryApp
//
//  Created by Amaryllis Baldrez on 17/02/22.
//

import Foundation

protocol NetworkProtocol {
    func request<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void)
}

protocol URLSessionProtocol {
    func fetchData(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: URLSessionProtocol {
    
    func fetchData(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let dataTask = dataTask(with: url, completionHandler: completionHandler)
        dataTask.resume()
    }
}

class HTTPClient: NetworkProtocol {
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func request<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(HTTPClientError.invalidURL))
            return
        }
        session.fetchData(with: url) { data, response, error in
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

