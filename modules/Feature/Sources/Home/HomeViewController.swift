import Navigation
import RestaurantsInterface
import ServicesInterface
import UIKit

public enum HomeStartSource {
    case appStart
    case deepLink(URL)
}

final class HomeViewController: UIViewController {
    struct Dependencies {
        var appNavigator: AppNavigator
        var deliveryClient: DeliveryClientProtocol
    }

    let dependencies: Dependencies
    let customView: HomeViewProtocol
    let source: HomeStartSource

    public init(
        source: HomeStartSource,
        customView: HomeViewProtocol,
        dependencies: Dependencies
    ) {
        self.source = source
        self.customView = customView
        self.dependencies = dependencies
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func loadView() {
        view = customView
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        title = "Delivery App"
        customView.delegate = self
    }

    override public func viewDidAppear(_: Bool) {
        fetchRestaurants()
    }

    func fetchRestaurants() {
        dependencies.deliveryClient.fetchRestaurant { [weak self] restaurants in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.customView.displayRestaurants(.init(restaurants: restaurants))
            }
        }
    }
}

extension HomeViewController: HomeViewDelegate {
    public func didTapOnRestaurantCell(restaurant: Restaurant) {
        let restaurantDetailsRoute = RestaurantDetailsRoute(
            restaurant: restaurant,
            delegate: self,
            onTapSomething: {
                print("Something was tapped or could anything else")
            }
        )

        try? dependencies.appNavigator.navigate(
            to: restaurantDetailsRoute,
            from: self,
            presentationStyle: PushPresentationStyle(),
            bindings: restaurantDetailsRoute.bindings
        )
    }
}

extension HomeViewController: RestaurantActionsDelegate {
    public func didFinishLoading() {
        print("didFinishLoading:")
    }

    public func errorOnLoading() {
        print("errorOnLoading:")
    }
}
