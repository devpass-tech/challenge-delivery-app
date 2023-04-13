import Foundation
import Navigation

public struct HomeFeature {
    public static func bootstrap() {
        try? RouterService
            .shared
            .registerFactory(
                factory: { route, bindings in
                    guard
                        let route = route as? HomeRoute,
                        let bindings = bindings as? HomeBindings
                    else {
                        preconditionFailure("Expected HomeRoute")
                    }
                    return HomeFactory.make(
                        source: route.source,
                        onSomeButtonTapped: bindings.onSomethingTapped
                    )
                },
                for: HomeRoute.self
            )
    }
}
