import Foundation
import Navigation

public struct HomeRoute: Route {
    public static var identifier: RouterIdentifier {
        "Home"
    }

    public var presentationStyle: PresentationStyle

    public init(presentationStyle: PresentationStyle = RootPresentationStyle()) {
        self.presentationStyle = presentationStyle
    }
}
