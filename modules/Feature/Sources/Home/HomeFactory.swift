import Foundation
import Services
import UIKit

public final class HomeFactory {
    public static func make() -> UIViewController {
        let customView = HomeView()
        let deliveryAPI = DeliveryApi()
        let viewController = HomeViewController(customView: customView, deliveryApi: deliveryAPI)
        customView.delegate = viewController
        return viewController
    }
}
