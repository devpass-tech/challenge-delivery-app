import Foundation
import UIKit

public typealias NavigationService = AppNavigator & SceneRegistration
final class NavigationServiceImplementation: NavigationService {
    private(set) var factories: [RouterIdentifier: SceneFactory] = [:]

    init() {}

    func navigate<Bindings>(
        to route: Route,
        from: UIViewController,
        presentationStyle: PresentationStyle,
        bindings: Bindings?
    ) throws {
        let destinationController = try mapRouteToController(route, bindings: bindings)
        switch presentationStyle {
        case let presentationStyle as PushPresentationStyle:
            guard let navigationController = from.navigationController else {
                throw AppNavigationFailure.withoutNavigationController
            }

            navigationController.pushViewController(
                destinationController,
                animated: presentationStyle.animated
            )

        case let presentationStyle as PresentPresentationStyle:
            from.present(
                destinationController,
                animated: presentationStyle.animated,
                completion: presentationStyle.completion
            )
        default:
            throw AppNavigationFailure.invalidPresentationStyle
        }
    }

    func controller(for route: Route) throws -> UIViewController {
        try mapRouteToController(route, bindings: nil)
    }

    func mapRouteToController(_ route: Route, bindings: Any?) throws -> UIViewController {
        let identifier = type(of: route).identifier
        guard let makeControllerForRoute = factories[identifier] else {
            throw AppNavigationFailure.invalidRoute
        }
        return makeControllerForRoute(route, bindings)
    }

    func registerFactory(factory: @escaping SceneFactory, for route: Route.Type) throws {
        guard factories[route.identifier] == nil else {
            throw SceneRegistrationFailure.alreadyExist
        }

        factories[route.identifier] = factory
    }
}
