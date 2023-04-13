import Foundation
import Services
import UIKit

public final class HomeFactory {
    public static func make(
        source: HomeStartSource,
        onSomeButtonTapped: @escaping () -> Void
    ) -> UIViewController {
        let customView = HomeView()
        let deliveryAPI = DeliveryApi()
        let viewController = HomeViewController(
            source: source,
            customView: customView,
            deliveryApi: deliveryAPI,
            onSomeButtonTapped: onSomeButtonTapped
        )
        customView.delegate = viewController
        return viewController
    }
}
