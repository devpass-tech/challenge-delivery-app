//
//  APIError.swift
//  DeliveryAppChallenge
//
//  Created by Hellen on 02/11/21.
//

import Foundation

enum APIError: Error {
    case networkError
    case decodeError
    case databaseError
    case invalidURL
}

extension APIError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .networkError:
            return "Ocorreu um erro ao conectar aos servidores"
        case .decodeError:
            return "Ocorreu um erro com decode dos dados"
        case .databaseError:
            return "Ocorreu um erro com o banco de dados"
        case .invalidURL:
            return "Ocorreu um erro com a url"
        }
    }
}
