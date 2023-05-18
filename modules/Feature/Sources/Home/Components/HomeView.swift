import UIKit
import UIFoundations
import ServicesInterface

// TODO: Improve them to a Object
public protocol HomeViewDelegate: AnyObject {
    func didTapOnRestaurantCell(restaurant: Restaurant)
}

public protocol HomeViewProtocol: UIView {
    var delegate: HomeViewDelegate? { get set }
    func displayRestaurants(_ viewModel: HomeView.ViewModel)
}

public final class HomeView: UIView {
    
    public struct ViewModel {
        let restaurants: [Restaurant]
    }
    
    private var viewModel: ViewModel
    public weak var delegate: HomeViewDelegate?
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RestaurantCell.self, forCellReuseIdentifier: "RestaurantCellIdentifier")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    public init() {
        viewModel = .init(restaurants: [])
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewCode {
    public func setupComponents() {
        addSubview(tableView)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

extension HomeView: HomeViewProtocol {
    
    public func displayRestaurants(_ viewModel: ViewModel) {
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
}

extension HomeView: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.restaurants.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCellIdentifier", for: indexPath) as! RestaurantCell
        cell.setup(viewModel.restaurants[indexPath.row])
        return cell
    }
}

extension HomeView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurant = viewModel.restaurants[indexPath.row]
        delegate?.didTapOnRestaurantCell(restaurant: restaurant)
    }
}
