import Foundation

public typealias NetworkResult<T: Decodable> = ((Result<T, Error>) -> Void)

public protocol NetworkManagerProtocol {
    
    func request<T: Decodable>(_ request: NetworkRequest, completion: @escaping NetworkResult<T>)
}

public final class NetworkManager: NetworkManagerProtocol {
    
    // MARK: - Private Properties
    
    private let urlSession: URLSessionProtocol
    
    // MARK: - Init
    
    public convenience init() {
        self.init(urlSession: URLSession.shared)
    }
    
    init(urlSession: URLSessionProtocol) {
        self.urlSession = urlSession
    }
    
    // MARK: - Public Functions
    
    public func request<T>(_ request: NetworkRequest, completion: @escaping NetworkResult<T>) {
        guard let url = URL(string: request.baseURL + request.pathURL) else {
            completion(.failure(NetworkingError.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        urlSession.loadData(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(NetworkingError.invalidStatusCode))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkingError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
                
            } catch {
                completion(.failure(NetworkingError.decodeError))
            }
        }
    }
}
