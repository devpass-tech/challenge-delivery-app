import Foundation
import Navigation
import ServicesInterface

public struct RestaurantDetailsRoute: Route {
    public static var identifier: RouterIdentifier {
        "RestaurantDetails"
    }

    public let restaurantInputs: RestaurantDetailsInputs
    public let bindings: RestaurantDetailsBindings

    public init(
        restaurant: Restaurant,
        delegate: RestaurantActionsDelegate?,
        onTapSomething: @escaping () -> Void
    ) {
        restaurantInputs = RestaurantDetailsInputs(restaurant: restaurant)

        bindings = RestaurantDetailsBindings(
            delegate: delegate,
            onTapSomething: onTapSomething
        )
    }
}

public struct RestaurantDetailsInputs {
    public let restaurant: Restaurant
}

public struct RestaurantDetailsBindings {
    public let onTapSomething: () -> Void
    public let delegate: RestaurantActionsDelegate?

    public init(
        delegate: RestaurantActionsDelegate?,
        onTapSomething: @escaping () -> Void
    ) {
        self.delegate = delegate
        self.onTapSomething = onTapSomething
    }
}

public protocol RestaurantActionsDelegate: AnyObject {
    func didFinishLoading()
    func errorOnLoading()
}
