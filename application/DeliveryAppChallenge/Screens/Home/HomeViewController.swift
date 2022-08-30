import UIKit
import Navigation
import Restaurants

final class HomeViewController: UIViewController {
    
    private let deliveryApi: DeliveryApiProtocol
    private let customView: HomeViewProtocol
    
    init(customView: HomeViewProtocol, deliveryApi: DeliveryApiProtocol) {
        self.customView = customView
        self.deliveryApi = deliveryApi
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Delivery App"
        customView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
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
    func didTapOnRestaurantCell() {
        let restaurantDetailsRoute = RestaurantDetailsRoute(presentationStyle: PushPresentationStyle())
        try? RouterService.shared.navigate(to: restaurantDetailsRoute, from: self)
    }
}
