import UIKit
import UIFoundations

final class RestaurantDetailsView: UIView {
    private let rowHeight: CGFloat = 100.0
    
    private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 80.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var headerView: RestaurantHeaderView = {
       return RestaurantHeaderView()
    }()
    
    private var valuationView: RestaurantValuationView = {
        return RestaurantValuationView()
    }()
    
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented yet")
    }
    
    func update(from restaurantName: String) {
        headerView.update(from: restaurantName)
        valuationView.update(with: 4.8, and: 351)
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
            restaurantMenuTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension RestaurantDetailsView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        rowHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: RestaurantHeaderCell.identifier) as? RestaurantHeaderCell else {
            return UIView()
        }
        headerView.update(with: "Café da manhã")
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantMenuCell.identifier,
                                                       for: indexPath) as? RestaurantMenuCell else {
            return UITableViewCell()
        }
        
        cell.update(with: "Copo pão de queijo + Suco de Laranja", price: 20.0)
        return cell
    }
}
