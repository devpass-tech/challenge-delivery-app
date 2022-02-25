//
//  RestaurantListView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 04/02/22.
//

import UIKit

protocol RestaurantListViewProtocol {
    func display(viewModel: [RestaurantListView.ViewModel])
}

class RestaurantListView: UIView, UITableViewDelegate, RestaurantListViewProtocol {
    
	struct ViewModel {
        let restaurant: RestaurantTableViewCell.ViewModel
	}
	
    private var viewModel: [ViewModel] = [] {
        didSet {
            restaurantTableView.reloadData()
        }
    }
	
	init() {
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
        tableView.register(RestaurantTableViewCell.self, forCellReuseIdentifier: RestaurantTableViewCell.identifier)
		tableView.dataSource = self
		tableView.delegate = self
		tableView.separatorStyle = .none
		
		return tableView
	}()
    
    func display(viewModel: [ViewModel]) {
        self.viewModel = viewModel
    }
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

extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
}

extension RestaurantListView: UITableViewDataSource {
    
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
	}
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.identifier, for: indexPath) as? RestaurantTableViewCell else {
            
            return UITableViewCell()
        }
        
        let cellViewModel = viewModel[indexPath.row]
        cell.display(viewModel: .init(urlImage: "", name: cellViewModel.restaurant.name, category: cellViewModel.restaurant.category, deliveryTimeMin: cellViewModel.restaurant.deliveryTimeMin, deliveryTimeMax: cellViewModel.restaurant.deliveryTimeMax))
        return cell
	}
}
