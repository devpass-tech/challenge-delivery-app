import Foundation

public protocol DeliveryApiProtocol {
    func fetchRestaurants(_ completion: ([String]) -> Void)
}
