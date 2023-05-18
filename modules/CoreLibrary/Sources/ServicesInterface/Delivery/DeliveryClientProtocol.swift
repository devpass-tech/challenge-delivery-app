import Foundation

public protocol DeliveryClientProtocol {
    func fetchRestaurant(_ completion: @escaping ([Restaurant]) -> Void)
    func fetchRestaurantDetail(restaurantName: String, completion: @escaping (RestaurantDetail?) -> Void)
}
