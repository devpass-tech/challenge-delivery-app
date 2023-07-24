import Foundation
import ServicesInterface
import Networking

public struct DeliveryClient: DeliveryClientProtocol {
    private let networkManager: NetworkManagerProtocol
    
    public init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    public func fetchRestaurant(_ completion: @escaping ([Restaurant]) -> Void) {
        completion(Restaurant.fixture)
    }
    
    public func fetchRestaurantDetail(restaurantName: String, completion: @escaping (RestaurantDetail?) -> Void) {
        completion(RestaurantDetail.fixture)
    }
}
