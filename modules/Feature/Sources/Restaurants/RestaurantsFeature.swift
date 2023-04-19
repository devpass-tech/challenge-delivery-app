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
                        restaurantName: route.restaurantInputs.name,
                        restaurantDetails: route.restaurantInputs.description,
                        delegate: bindings.delegate,
                        onSomeButtonTapped: bindings.onTapSomething)
                },
                for: RestaurantDetailsRoute.self
            )
    }
}
