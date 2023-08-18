import DependencyInjection
import Foundation
import Navigation
import RestaurantsInterface
import ServicesInterface

public enum RestaurantFeature {
    struct Dependencies {
        @Resolved var navigationService: NavigationService
        @Resolved var deliveryClient: DeliveryClientProtocol
    }

    static var dependencies: Dependencies = .init()

    public static func bootstrap() {
        let navigationService = dependencies.navigationService
        try? navigationService.registerFactory(
            factory: { route, bindings in
                guard
                    let route = route as? RestaurantDetailsRoute,
                    let bindings = bindings as? RestaurantDetailsBindings
                else {
                    preconditionFailure("Expected HomeRoute")
                }
                let viewModel = RestaurantDetailsViewModel(
                    restaurant: route.restaurantInputs.restaurant,
                    onTapSomething: bindings.onTapSomething
                )
                let viewController = RestaurantDetailsViewController(
                    viewModel: viewModel,
                    deliveryClient: dependencies.deliveryClient
                )
                viewController.delegate = bindings.delegate
                return viewController
            },
            for: RestaurantDetailsRoute.self
        )
    }
}
