import Foundation
import Navigation

public struct HomeRoute: Route {
    public static var identifier: RouterIdentifier {
        "Home"
    }

    let source: HomeStartSource

    public init(source: HomeStartSource) {
        self.source = source
    }
}
