import Foundation

public struct Restaurant: Decodable {
    public let name: String
    public let category: String
    public let deliveryTime: RestaurantDeliveryTime

    public enum CodingKeys: String, CodingKey {
        case name, category
        case deliveryTime = "delivery_time"
    }
}
