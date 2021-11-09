//
//  HomeView.swift
//  DeliveryAppChallenge
//
//  Created by Gabriel on 04/11/21.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    
}

protocol HomeViewProtocol: UIView {
    var delegate: HomeViewDelegate? { get set }
    func displayRestaurants(_ viewModel: HomeView.ViewModel)
}

final class HomeView: UIView {
    
    struct ViewModel {
        let restaurants: [String]
    }
    
    private var viewModel: ViewModel
    weak var delegate: HomeViewDelegate?
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RestaurantCell.self, forCellReuseIdentifier: "RestaurantCellIdentifier")
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    init() {
        viewModel = .init(restaurants: [])
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewCode {
    
    func setupComponents() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

extension HomeView: HomeViewProtocol {
    
    func displayRestaurants(_ viewModel: ViewModel) {
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
}

extension HomeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCellIdentifier", for: indexPath) as! RestaurantCell
        return cell
    }
}
