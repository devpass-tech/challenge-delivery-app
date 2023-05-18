import UIKit
import ServicesInterface

public final class RestaurantDetailsFactory {
    public static func make(
        restaurant: Restaurant,
        delegate: RestaurantActionsDelegate?,
        deliveryClient: DeliveryClientProtocol,
        onSomeButtonTapped: @escaping () -> Void
    ) -> UIViewController {
        let viewModel = RestaurantDetailsViewModel(
            restaurant: restaurant,
            onTapSomething: onSomeButtonTapped
        )
        let viewController = RestaurantDetailsViewController(viewModel: viewModel, deliveryClient: deliveryClient)
        viewController.delegate = delegate
        return viewController
    }
}
