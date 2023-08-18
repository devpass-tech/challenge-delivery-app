import Foundation
import Navigation
import RestaurantsInterface
import ServicesInterface
import UIKit

public struct RestaurantDetailsViewModel {
    let restaurant: Restaurant
    let onTapSomething: () -> Void
}

public final class RestaurantDetailsViewController: UIViewController {
    public weak var delegate: RestaurantActionsDelegate?
    private let viewModel: RestaurantDetailsViewModel
    private let deliveryClient: DeliveryClientProtocol

    private var detailView: RestaurantDetailsView = .init()

    init(viewModel: RestaurantDetailsViewModel, deliveryClient: DeliveryClientProtocol) {
        self.viewModel = viewModel
        self.deliveryClient = deliveryClient
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func loadView() {
        view = detailView
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        detailView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        callRestaurantDetail()
    }

    private func callRestaurantDetail() {
        deliveryClient.fetchRestaurantDetail(restaurantName: viewModel.restaurant.name) { [weak self] detail in
            guard let restaurantModel = self?.viewModel.restaurant, let restaurantDetail = detail else { return }
            self?.detailView.update(from: restaurantModel, restaurantDetail: restaurantDetail)
        }
    }

    @objc func handleTap(_: UITapGestureRecognizer) {
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
