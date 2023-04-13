import Foundation
import UIKit

public typealias SceneFactory = (_ route: Route, _ bindings: Any?) -> UIViewController

public enum NavigatorFailure: Error {
    case invalidPresentationStyle
    case withoutNavigationController
    case invalidRoute
}

public enum SceneRegistrationFailure: Error {
    case alreadyExist
}

// TODO: Testing the whole navigation and thinking about communicate between scenes
public protocol NavigatorProtocol {
    func navigate<Bindings>(
        to route: Route,
        from: UIViewController,
        presentationStyle: PresentationStyle,
        bindings: Bindings?
    ) throws
    
    func controller(for route: Route) throws -> UIViewController
}
public extension NavigatorProtocol {
    func navigate(
        to route: Route,
        from controller: UIViewController,
        presentationStyle: PresentationStyle
    ) {
        try? self.navigate(to: route, from: controller, presentationStyle: presentationStyle, bindings: ())
    }
}

public protocol SceneRegisteringProtocol {
    func registerFactory(factory: @escaping SceneFactory, for route: Route.Type) throws
}

public final class RouterService: NavigatorProtocol, SceneRegisteringProtocol {
    public static let shared = RouterService()
    
    private(set) var factories: [RouterIdentifier : SceneFactory] = [:]
    
    public init() {}

    public func navigate<Bindings>(
        to route: Route,
        from: UIViewController,
        presentationStyle: PresentationStyle,
        bindings: Bindings?
    ) throws {
        let destinationController = try mapRouteToController(route, bindings: bindings)
        switch presentationStyle {
        case let presentationStyle as PushPresentationStyle:
            guard let navigationController = from.navigationController else {
                throw NavigatorFailure.withoutNavigationController
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
            throw NavigatorFailure.invalidPresentationStyle
        }
    }
    
    public func controller(for route: Route) throws -> UIViewController {
        try mapRouteToController(route, bindings: nil)
    }

    private func mapRouteToController(_ route: Route, bindings: Any?) throws -> UIViewController {
        let identifier = type(of: route).identifier
        guard let makeControllerForRoute = factories[identifier] else {
            throw NavigatorFailure.invalidRoute
        }
        return makeControllerForRoute(route, bindings)
    }

    public func registerFactory(factory: @escaping SceneFactory, for route: Route.Type) throws {

        guard factories[route.identifier] == nil else {
            throw SceneRegistrationFailure.alreadyExist
        }

        factories[route.identifier] = factory
    }
}
