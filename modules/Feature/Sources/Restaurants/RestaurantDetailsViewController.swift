import Navigation
import UIKit
import Foundation

public struct RestaurantDetailsViewModel {
    let name: String
    let description: String
    let onTapSomething: () -> Void
}

public final class RestaurantDetailsViewController: UIViewController {
    public weak var delegate: RestaurantActionsDelegate?
    private let viewModel: RestaurantDetailsViewModel

    private var detailView: RestaurantDetailsView = {
        RestaurantDetailsView()
    }()
    
    init(viewModel: RestaurantDetailsViewModel) {
        self.viewModel = viewModel
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
        detailView.update(from: viewModel.name)
        detailView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:))))
        simulateLoading()
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
