import DependencyInjection
import Foundation
import NetworkingInterface
import ServicesInterface

public struct DeliveryClient: DeliveryClientProtocol {
    @Resolved var networkManager: NetworkManagerProtocol

    public init() {}

    public func fetchRestaurant(_ completion: @escaping ([Restaurant]) -> Void) {
        completion(Restaurant.fixture)
    }

    public func fetchRestaurantDetail(restaurantName _: String, completion: @escaping (RestaurantDetail?) -> Void) {
        completion(RestaurantDetail.fixture)
    }
}
