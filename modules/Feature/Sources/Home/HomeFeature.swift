import Foundation
import Navigation

public struct HomeFeature {
    public static func bootstrap() {
        try? RouterService
            .shared
            .registerFactory(factory: { _ in
                return HomeFactory.make()
            }, for: HomeRoute.self)
    }
}
