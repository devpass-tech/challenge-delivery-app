import ServicesInterface
import UIFoundations
import UIKit

final class RestaurantDetailsView: UIView {
    private let rowHeight: CGFloat = 100.0

    private var restaurantDetails: RestaurantDetail?

    private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 80.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var headerView: RestaurantHeaderView = .init()

    private var valuationView: RestaurantValuationView = .init()

    private lazy var restaurantMenuTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.separatorColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RestaurantHeaderCell.self, forHeaderFooterViewReuseIdentifier: RestaurantHeaderCell.identifier)
        tableView.register(RestaurantMenuCell.self, forCellReuseIdentifier: RestaurantMenuCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented yet")
    }

    func update(from restaurant: Restaurant, restaurantDetail: RestaurantDetail) {
        restaurantDetails = restaurantDetail
        headerView.update(from: restaurant)
        valuationView.update(with: restaurantDetail.reviews.score, and: restaurantDetail.reviews.count)
        restaurantMenuTableView.reloadData()
    }
}

extension RestaurantDetailsView: ViewCode {
    func setupComponents() {
        addSubview(contentStackView)
        addSubview(restaurantMenuTableView)
        contentStackView.addArrangedSubview(headerView)
        contentStackView.addArrangedSubview(valuationView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 100.0),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            restaurantMenuTableView.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 20.0),
            restaurantMenuTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            restaurantMenuTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantMenuTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension RestaurantDetailsView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in _: UITableView) -> Int {
        restaurantDetails?.grouppedCategories.count ?? 0
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        4
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        rowHeight
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection _: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: RestaurantHeaderCell.identifier) as? RestaurantHeaderCell else {
            return UIView()
        }
        headerView.update(with: "Café da manhã")
        return headerView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantMenuCell.identifier,
                                                       for: indexPath) as? RestaurantMenuCell
        else {
            return UITableViewCell()
        }

        cell.update(with: "Copo pão de queijo + Suco de Laranja", price: 20.0)
        return cell
    }
}
