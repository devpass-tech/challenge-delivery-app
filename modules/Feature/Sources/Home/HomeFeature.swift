import DependencyInjection
import Foundation
import Navigation
import ServicesInterface

public struct HomeFeature {
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
                    let route = route as? HomeRoute
                else {
                    preconditionFailure("Expected HomeRoute")
                }
                
                let customView = HomeView()
                let viewController = HomeViewController(
                    source: route.source,
                    customView: customView,
                    dependencies: .init(
                        appNavigator: dependencies.navigationService,
                        deliveryClient: dependencies.deliveryClient
                    )
                )
                customView.delegate = viewController
                return viewController
            },
            for: HomeRoute.self
        )
    }
}
