import UIKit
import UIFoundations

final class RestaurantDetailsView: UIView {
    
    private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var headerView: RestaurantHeaderView = {
       return RestaurantHeaderView()
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented yet")
    }
    
    func update(from restaurantName: String) {
        self.headerView.update(from: restaurantName)
    }
}

extension RestaurantDetailsView: ViewCode {
    func setupComponents() {
        addSubview(contentStackView)
        contentStackView.addArrangedSubview(headerView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 100.0),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        ])
    }
}
