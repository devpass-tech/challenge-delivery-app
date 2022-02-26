import Foundation
import UIKit

protocol RestaurantRouteDataPassing {
    var dataStore: RestaurantListDataStore? { get set }
}

protocol RestaurantListRoutingLogic {
    func routeToRestaurantMenu(at row: Int) 
}

final class RestaurantListRouter: RestaurantRouteDataPassing {
    weak var viewController: UIViewController?
    var dataStore: RestaurantListDataStore?
}

extension RestaurantListRouter: RestaurantListRoutingLogic {
    func routeToRestaurantMenu(at row: Int) {
        guard let restaurant = dataStore?.restaurants[row] else { return }
        let nextViewController = RestaurantDetailsConfigurator.make(dependencies: .init(restaurant: restaurant))
        viewController?.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
