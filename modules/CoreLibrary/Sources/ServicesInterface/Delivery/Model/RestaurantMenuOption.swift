import Foundation

public struct RestaurantMenuOption: Decodable {
    public let category: String
    public let name: String
    public let price: Int
}
