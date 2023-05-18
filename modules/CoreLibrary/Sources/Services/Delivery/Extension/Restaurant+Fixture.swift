import Foundation
import ServicesInterface

extension Restaurant {
    static var fixture: [Restaurant] {
        "home_restaurant_list".loadJsonArray() ?? []
    }
}

extension RestaurantDetail {
    static var fixture: RestaurantDetail? {
        "restaurant_details".loadJson()
    }
}
