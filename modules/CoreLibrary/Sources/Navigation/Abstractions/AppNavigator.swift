import Foundation
import UIKit

public enum AppNavigationFailure: Error {
    case invalidPresentationStyle
    case withoutNavigationController
    case invalidRoute
}

public protocol AppNavigator {
    func navigate<Bindings>(
        to route: Route,
        from: UIViewController,
        presentationStyle: PresentationStyle,
        bindings: Bindings?
    ) throws

    func controller(for route: Route) throws -> UIViewController
}

public extension AppNavigator {
    func navigate(
        to route: Route,
        from controller: UIViewController,
        presentationStyle: PresentationStyle
    ) {
        try? navigate(to: route, from: controller, presentationStyle: presentationStyle, bindings: ())
    }
}
