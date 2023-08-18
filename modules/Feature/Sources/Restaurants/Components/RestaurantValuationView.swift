import UIFoundations
import UIKit

// TODO: Implement stars component
/// Move this strings to a localizable.strings - Discuss with Bocato how should be the localizable
final class RestaurantValuationView: UIView {
    private var averageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var numberOfValutionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var mainContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(with average: Double, and numberOfValuations: Int) {
        averageLabel.text = "\(average)"
        numberOfValutionsLabel.text = "\(numberOfValuations) avaliações"
    }
}

extension RestaurantValuationView: ViewCode {
    func setupComponents() {
        addSubview(mainContentStackView)
        mainContentStackView.addArrangedSubview(averageLabel)
        mainContentStackView.addArrangedSubview(numberOfValutionsLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainContentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            mainContentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
        ])
    }
}
