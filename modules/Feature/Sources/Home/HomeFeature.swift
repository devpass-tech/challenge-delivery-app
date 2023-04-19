import Foundation
import Navigation

public struct HomeFeature {
    public static func bootstrap() {
        try? RouterService
            .shared
            .registerFactory(
                factory: { route, bindings in
                    guard
                        let route = route as? HomeRoute
                    else {
                        preconditionFailure("Expected HomeRoute")
                    }
                    return HomeFactory.make(source: route.source)
                },
                for: HomeRoute.self
            )
    }
}
