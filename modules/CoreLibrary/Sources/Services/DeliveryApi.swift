import Foundation
import ServicesInterface

public struct DeliveryApi { // : DeliveryApiProtocol {
    public init() {}
    public func fetchRestaurants(_ completion: ([String]) -> Void) {
        completion(["Restaurant 1", "Restaurant 2", "Restaurant 3"])
    }
}
