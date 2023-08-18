import Foundation

public struct RestaurantDetail: Decodable {
    public let name: String
    public let category: String
    public let deliveryTime: RestaurantDeliveryTime
    public let reviews: RestaurantReview
    public let menu: [RestaurantMenuOption]

    public enum CodingKeys: String, CodingKey {
        case deliveryTime = "delivery_time"
        case name, category, reviews, menu
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        category = try container.decode(String.self, forKey: .category)
        deliveryTime = try container.decode(RestaurantDeliveryTime.self, forKey: .deliveryTime)
        reviews = try container.decode(RestaurantReview.self, forKey: .reviews)
        menu = try container.decode([RestaurantMenuOption].self, forKey: .menu)
    }

    public var grouppedCategories: [String] {
        menu.map { $0.category }
    }

    public func menuOptionsFor(category: String) -> [RestaurantMenuOption] {
        menu.filter {
            $0.category.caseInsensitiveCompare(category) == .orderedSame
        }
    }
}
