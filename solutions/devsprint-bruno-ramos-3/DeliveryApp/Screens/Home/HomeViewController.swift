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

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        setupSearchBar()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        deliveryApi.fetchRestaurants { restaurants in

            DispatchQueue.main.async {

                self.homeView.updateView(with: restaurants)
            }
        }
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    func setupSearchBar() {
        let search = UISearchController()
        
        navigationItem.searchController = search
        navigationItem.title = "Delivery App"
        
        search.searchBar.delegate = self
        search.searchBar.placeholder = "Nome do restaurante"
        search.obscuresBackgroundDuringPresentation = false
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    }
}
