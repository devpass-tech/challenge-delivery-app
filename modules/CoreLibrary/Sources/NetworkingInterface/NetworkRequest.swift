import Foundation

public protocol NetworkRequest {
    
    var baseURL: String { get }
    
    var pathURL: String { get }
    
    var method: HTTPMethod { get }
}

public enum HTTPMethod: String {
    case get = "GET"
}
