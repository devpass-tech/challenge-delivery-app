import Foundation
import Navigation

public struct RestaurantFeature {
    public static func bootstrap() {
        try? RouterService
            .shared
            .registerFactory(
                factory: { route, bindings in
                    guard
                        let route = route as? RestaurantDetailsRoute,
                        let bindings = bindings as? RestaurantDetailsBindings
                    else {
                        preconditionFailure("Expected HomeRoute")
                    }
                    return RestaurantDetailsFactory.make(
                        restaurant: route.restaurantInputs.restaurant,
                        delegate: bindings.delegate,
                        deliveryClient: bindings.deliveryClient, // Think about this!
                        onSomeButtonTapped: bindings.onTapSomething
                    )
                },
                for: RestaurantDetailsRoute.self
            )
    }
}
