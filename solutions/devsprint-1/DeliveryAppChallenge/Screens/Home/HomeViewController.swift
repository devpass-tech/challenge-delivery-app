//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

class HomeViewController: UIViewController {

    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RestaurantCellIdentifier")
        tableView.dataSource = self
        return tableView
    }()

    let deliveryApi = DeliveryApi()
    var restaurants: [String] = []
    
    private lazy var dividerView: DividerView = {
        let dividerView = DividerView.init()
        return dividerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Delivery App"
        setup()
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

extension HomeViewController: ViewCode {
    
    func setupComponents() {
        view.addSubview(tableView)
        view.addSubview(dividerView)
    }
    
    func setupConstraints() {
       
        NSLayoutConstraint.activate([
            
            dividerView.dividerView.widthAnchor.constraint(equalToConstant: view.frame.width),
            dividerView.dividerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: dividerView.dividerView.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func setupExtraConfiguration() {
        
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
