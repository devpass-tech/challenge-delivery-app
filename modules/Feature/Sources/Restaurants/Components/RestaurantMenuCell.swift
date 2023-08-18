import UIFoundations
import UIKit

final class RestaurantMenuCell: UITableViewCell {
    private let imageSize: CGFloat = 50.0
    static let identifier: String = "RestaurantMenuCell"

    private lazy var itemLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var itemPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "pizza")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private var mainContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var itemInformationContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(with item: String, price: Double) {
        itemLabel.text = item
        itemPriceLabel.text = "R$\(price)"
    }
}

extension RestaurantMenuCell: ViewCode {
    func setupComponents() {
        addSubview(mainContentStackView)
        mainContentStackView.addArrangedSubview(itemInformationContentStackView)
        mainContentStackView.addArrangedSubview(itemImageView)
        itemInformationContentStackView.addArrangedSubview(itemLabel)
        itemInformationContentStackView.addArrangedSubview(itemPriceLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            itemImageView.widthAnchor.constraint(equalToConstant: imageSize),
            itemImageView.heightAnchor.constraint(equalToConstant: imageSize),
            mainContentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            mainContentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
        ])
    }

    func setupExtraConfiguration() {
        itemImageView.layer.cornerRadius = 16.0
    }
}
