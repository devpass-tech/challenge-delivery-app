//
//  RestaurantListView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 04/02/22.
//

import UIKit

class RestaurantListView: UIView, UITableViewDelegate {
	
	struct ViewModel {
		let restaurants: [String]
	}
	
	private var viewModel: ViewModel
	
	init() {
		viewModel = .init(restaurants: [])
		super.init(frame: .zero)
		restaurantTableView.reloadData()
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private lazy var restaurantTableView: UITableView = {
		let tableView = UITableView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
//		tableView.register(RestaurantTableViewCell.self, forCellReuseIdentifier: "cell")
		tableView.dataSource = self
		tableView.delegate = self
		tableView.separatorStyle = .none
		
		return tableView
	}()
}

extension RestaurantListView: ViewCode {
	func setupComponents() {
		addSubview(restaurantTableView)
	}
	
	func setupConstraints() {
		
		NSLayoutConstraint.activate([
			restaurantTableView.topAnchor.constraint(equalTo: topAnchor),
			restaurantTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
			restaurantTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
			restaurantTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}

extension RestaurantListView: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		UITableViewCell()
	}
}
