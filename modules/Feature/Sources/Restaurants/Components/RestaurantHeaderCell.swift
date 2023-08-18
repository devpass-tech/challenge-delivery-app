import UIFoundations
import UIKit

final class RestaurantHeaderCell: UITableViewHeaderFooterView {
    static let identifier = "RestaurantHeaderCell"

    private var headerTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(with title: String) {
        headerTitleLabel.text = title
    }
}

extension RestaurantHeaderCell: ViewCode {
    func setupComponents() {
        addSubview(headerTitleLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            headerTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
        ])
    }
}
