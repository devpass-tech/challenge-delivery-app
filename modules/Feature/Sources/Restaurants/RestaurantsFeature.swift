import Foundation
import Navigation

public struct RestaurantFeature {
    public static func bootstrap() {
        try? RouterService
            .shared
            .registerFactory(
                factory: { _ in
                    return RestaurantDetailsViewController()
                }, for: RestaurantDetailsRoute.self
            )
    }
}
