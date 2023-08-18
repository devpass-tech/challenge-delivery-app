import ServicesInterface
import UIFoundations
import UIKit

final class RestaurantCell: UITableViewCell {
    static let identifier = "RestaurantCellIdentifier"

    override init(style _: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let restaurantLogo: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = #imageLiteral(resourceName: "restaurant-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.clipsToBounds = true
        logoImageView.layer.masksToBounds = true
        return logoImageView
    }()

    private let restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let restaurantTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func setup(_ restaurant: Restaurant) {
        restaurantNameLabel.text = restaurant.name
        restaurantTypeLabel.text = "\(restaurant.category) - \(restaurant.deliveryTime.min)-\(restaurant.deliveryTime.max) min"
    }
}

extension RestaurantCell: ViewCode {
    func setupComponents() {
        contentView.addSubview(restaurantLogo)
        contentView.addSubview(restaurantNameLabel)
        contentView.addSubview(restaurantTypeLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 60),

            restaurantLogo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            restaurantLogo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            restaurantLogo.widthAnchor.constraint(equalToConstant: 45),
            restaurantLogo.heightAnchor.constraint(equalToConstant: 45),

            restaurantNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            restaurantNameLabel.leadingAnchor.constraint(equalTo: restaurantLogo.trailingAnchor, constant: 10),
            restaurantNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            restaurantTypeLabel.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor),
            restaurantTypeLabel.leadingAnchor.constraint(equalTo: restaurantNameLabel.leadingAnchor),
        ])
    }

    func setupExtraConfiguration() {
        restaurantLogo.layer.cornerRadius = frame.height / 2
        accessoryType = .disclosureIndicator
    }
}
