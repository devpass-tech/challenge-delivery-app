import Foundation
import Services
import UIKit
import ServicesInterface

public final class HomeFactory {
    public static func make(
        source: HomeStartSource
    ) -> UIViewController {
        let customView = HomeView()
        let deliveryAPI = DeliveryApi()
        let viewController = HomeViewController(
            source: source,
            customView: customView,
            deliveryApi: deliveryAPI
        )
        customView.delegate = viewController
        return viewController
    }
}
