//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

class HomeViewController: UIViewController {

    private let deliveryApi = DeliveryApi()

    private let homeView: HomeView = {

        let homeView = HomeView()
        return homeView
    }()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Nome do restaurante"
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Delivery App"
        
        deliveryApi.fetchRestaurants { restaurants in

            DispatchQueue.main.async {

                self.homeView.updateView(with: restaurants)
            }
        }
    }
    
    override func loadView() {
        self.view = homeView
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    }
}
