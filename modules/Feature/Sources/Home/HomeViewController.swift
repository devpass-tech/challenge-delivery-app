import UIKit
import Navigation
import ServicesInterface
import Restaurants

public enum HomeStartSource {
    case appStart
    case deepLink(URL)
}

public final class HomeViewController: UIViewController {
    let deliveryClient: DeliveryClientProtocol
    let customView: HomeViewProtocol
    let source: HomeStartSource
    
    public init(
        source: HomeStartSource,
        customView: HomeViewProtocol,
        deliveryClient: DeliveryClientProtocol
    ) {
        self.customView = customView
        self.deliveryClient = deliveryClient
        self.source = source
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = customView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Delivery App"
        customView.delegate = self
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        fetchRestaurants()
    }
    
    func fetchRestaurants() {
        deliveryClient.fetchRestaurant { [weak self] restaurants in
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
            deliveryClient: deliveryClient,
            delegate: self,
            onTapSomething: {
                print("Something was tapped or could anything else")
            })
        
        try? RouterService.shared.navigate(
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
