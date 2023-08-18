import Foundation
import ServicesInterface
import NetworkingInterface
import DependencyInjection

public struct DeliveryClient: DeliveryClientProtocol {
    @Resolved var networkManager: NetworkManagerProtocol
    
    public init() {}
    
    public func fetchRestaurant(_ completion: @escaping ([Restaurant]) -> Void) {
        completion(Restaurant.fixture)
    }
    
    public func fetchRestaurantDetail(restaurantName: String, completion: @escaping (RestaurantDetail?) -> Void) {
        completion(RestaurantDetail.fixture)
    }
}
