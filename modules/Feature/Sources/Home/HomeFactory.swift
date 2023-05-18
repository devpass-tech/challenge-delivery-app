import Foundation
import Services
import UIKit
import ServicesInterface

public final class HomeFactory {
    public static func make(
        source: HomeStartSource
    ) -> UIViewController {
        let customView = HomeView()
        let deliveryClient = DeliveryClient()
        let viewController = HomeViewController(
            source: source,
            customView: customView,
            deliveryClient: deliveryClient
        )
        customView.delegate = viewController
        return viewController
    }
}
