import UIKit
import SwiftUI
import UIFoundations

public final class RestaurantHeaderView: UIView {
    
    private var restaurantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "restaurant-logo")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var restaurantLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var mainContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let imageFrame: CGFloat = 60.0
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented yet")
    }
    
    func update(from restaurantName: String) {
        restaurantLabel.text = restaurantName
    }
}

extension RestaurantHeaderView: ViewCode {
    
    public func setupComponents() {
        addSubview(mainContentStackView)
        mainContentStackView.addArrangedSubview(restaurantLabel)
        mainContentStackView.addArrangedSubview(restaurantImageView)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            restaurantImageView.widthAnchor.constraint(equalToConstant: imageFrame),
            restaurantImageView.heightAnchor.constraint(equalToConstant: imageFrame),
            mainContentStackView.topAnchor.constraint(equalTo: topAnchor),
            mainContentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            mainContentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0)
        ])
    }
    
    public func setupExtraConfiguration() {
        restaurantImageView.layer.cornerRadius = imageFrame/2
    }
}