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
        deliveryClient: DeliveryClientProtocol,
        delegate: RestaurantActionsDelegate?,
        onTapSomething: @escaping () -> Void
    ) {
        self.restaurantInputs = RestaurantDetailsInputs(restaurant: restaurant)
        
        self.bindings = RestaurantDetailsBindings(
            deliveryClient: deliveryClient,
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
    public let deliveryClient: DeliveryClientProtocol
    public let delegate: RestaurantActionsDelegate?
    
    public init(
        deliveryClient: DeliveryClientProtocol,
        delegate: RestaurantActionsDelegate?,
        onTapSomething: @escaping () -> Void
    ) {
        self.deliveryClient = deliveryClient
        self.delegate = delegate
        self.onTapSomething = onTapSomething
    }
}

public protocol RestaurantActionsDelegate: AnyObject {
    func didFinishLoading()
    func errorOnLoading()
}
