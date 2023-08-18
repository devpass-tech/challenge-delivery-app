import Foundation
import UIKit

public typealias RouterIdentifier = String

public protocol Route {
    static var identifier: RouterIdentifier { get }
}
