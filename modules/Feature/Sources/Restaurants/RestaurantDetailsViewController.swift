import Navigation
import UIKit
import Foundation
import ServicesInterface
import RestaurantsInterface

public struct RestaurantDetailsViewModel {
    let restaurant: Restaurant
    let onTapSomething: () -> Void
}

public final class RestaurantDetailsViewController: UIViewController {
    public weak var delegate: RestaurantActionsDelegate?
    private let viewModel: RestaurantDetailsViewModel
    private let deliveryClient: DeliveryClientProtocol

    private var detailView: RestaurantDetailsView = {
        RestaurantDetailsView()
    }()
    
    init(viewModel: RestaurantDetailsViewModel, deliveryClient: DeliveryClientProtocol) {
        self.viewModel = viewModel
        self.deliveryClient = deliveryClient
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = detailView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        detailView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:))))
        callRestaurantDetail()
    }
    
    private func callRestaurantDetail() {
        deliveryClient.fetchRestaurantDetail(restaurantName: viewModel.restaurant.name) { [weak self] detail in
            guard let restaurantModel = self?.viewModel.restaurant, let restaurantDetail = detail else { return }
            self?.detailView.update(from: restaurantModel, restaurantDetail: restaurantDetail)
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        viewModel.onTapSomething()
    }
}

private extension RestaurantDetailsViewController {
    func simulateLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.delegate?.didFinishLoading()
        }
    }
}
