import UIKit

public final class RestaurantDetailsFactory {
    public static func make(
        restaurantName: String,
        restaurantDetails: String,
        delegate: RestaurantActionsDelegate?,
        onSomeButtonTapped: @escaping () -> Void
    ) -> UIViewController {
        let viewModel = RestaurantDetailsViewModel(
            name: restaurantName,
            description: restaurantDetails,
            onTapSomething: onSomeButtonTapped
        )
        
        let viewController = RestaurantDetailsViewController(viewModel: viewModel)
        viewController.delegate = delegate
        return viewController
    }
}
