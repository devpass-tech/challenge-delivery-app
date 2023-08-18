import Foundation
import UIKit

public typealias SceneFactory = (_ route: Route, _ bindings: Any?) -> UIViewController

public enum SceneRegistrationFailure: Error {
    case alreadyExist
}

public protocol SceneRegistration {
    func registerFactory(factory: @escaping SceneFactory, for route: Route.Type) throws
}
