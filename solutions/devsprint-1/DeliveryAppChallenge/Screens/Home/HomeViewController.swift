//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var tableView: UITableView = {

        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RestaurantCellIdentifier")
        tableView.dataSource = self
        return tableView
    }()

    let deliveryApi = DeliveryApi()
    var restaurants: [String] = []

    init() {
        super.init(nibName: nil, bundle: nil)

        view.backgroundColor = .white
        title = "Delivery App"

        addSubviews()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {

        fetchRestaurants()
    }

    func fetchRestaurants() {

        deliveryApi.fetchRestaurants { restaurants in

            self.restaurants = restaurants
            
            DispatchQueue.main.async {

                self.tableView.reloadData()
            }
        }
    }
}

extension HomeViewController {

    func addSubviews() {

        view.addSubview(tableView)
    }

    func configureConstraints() {

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return restaurants.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCellIdentifier", for: indexPath)

        cell.textLabel?.text = restaurants[indexPath.row]
        return cell
    }
}
