import UIKit
import Navigation
import Restaurants
import ServicesInterface

public final class HomeViewController: UIViewController {
    
    let deliveryApi: DeliveryAPIProtocol
    let customView: HomeViewProtocol
    
    public init(customView: HomeViewProtocol, deliveryApi: DeliveryAPIProtocol) {
        self.customView = customView
        self.deliveryApi = deliveryApi
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
        deliveryApi.fetchRestaurants { [weak self] restaurants in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.customView.displayRestaurants(.init(restaurants: restaurants))
            }
        }
    }
}

extension HomeViewController: HomeViewDelegate {
    public func didTapOnRestaurantCell() {
        let restaurantDetailsRoute = RestaurantDetailsRoute(presentationStyle: PushPresentationStyle())
        try? RouterService.shared.navigate(to: restaurantDetailsRoute, from: self)
    }
}
