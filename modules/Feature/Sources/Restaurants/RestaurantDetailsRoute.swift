import Foundation
import Navigation

public struct RestaurantDetailsRoute: Route {
    public static var identifier: RouterIdentifier {
        "RestaurantDetails"
    }
    
    public let restaurantInputs: RestaurantDetailsInputs
    public let bindings: RestaurantDetailsBindings

    public init(
        restaurantName: String,
        restaurantDescription: String,
        delegate: RestaurantActionsDelegate?,
        onTapSomething: @escaping () -> Void
    ) {
        self.restaurantInputs = RestaurantDetailsInputs(
            name: restaurantName,
            description: restaurantDescription
        )
        
        self.bindings = RestaurantDetailsBindings(
            delegate: delegate,
            onTapSomething: onTapSomething
        )
    }
}

public struct RestaurantDetailsInputs {
    public let name: String
    public let description: String
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
