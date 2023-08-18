import Foundation

public typealias NetworkResult<T: Decodable> = (Result<T, Error>) -> Void

public protocol NetworkManagerProtocol {
    func request<T: Decodable>(_ request: NetworkRequest, completion: @escaping NetworkResult<T>)
}
