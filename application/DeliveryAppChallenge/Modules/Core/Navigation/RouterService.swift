//
//  RouterService.swift
//  DeliveryAppChallenge
//
//  Created by Gustavo Soares on 06/07/22.
//

import Foundation
import UIKit

typealias SceneFactory = (_ route: Route) -> UIViewController

enum NavigatorFailure: Error {
    case invalidPresentationStyle
    case withoutNavigationController
    case invalidRoute
}

enum SceneRegistrationFailure: Error {
    case alreadyExist
}

// TODO: Testing the whole navigation and thinking about communicate between scenes
protocol NavigatorProtocol {
    func navigate(to route: Route, from: UIViewController) throws
}

protocol SceneRegisteringProtocol {
    func registerFactory(factory: @escaping SceneFactory, for route: Route.Type) throws
}

final class RouterService: NavigatorProtocol, SceneRegisteringProtocol {
    private var factories: [RouterIdentifier: SceneFactory] = [:]
    static let shared = RouterService()

    func navigate(to route: Route, from: UIViewController) throws {
        let destinationController = try mapRouteToController(route)
        switch route.presentationStyle {
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

    private func mapRouteToController(_ route: Route) throws -> UIViewController {
        let identifier = type(of: route).identifier
        guard let makeControllerForRoute = factories[identifier] else {
            throw NavigatorFailure.invalidRoute
        }
        return makeControllerForRoute(route)
    }

    func registerFactory(factory: @escaping SceneFactory, for route: Route.Type) throws {
        guard factories[route.identifier] == nil else {
            throw SceneRegistrationFailure.alreadyExist
        }

        factories[route.identifier] = factory
    }
}
