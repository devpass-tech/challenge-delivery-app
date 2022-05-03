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
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Nome do restaurante"
        return searchController
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setup()
        deliveryApi.fetchRestaurants { restaurants in
            
            DispatchQueue.main.async {
                
                self.homeView.updateView(with: restaurants)
            }
        }
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    
    private func setup() {
        navigationItem.title = "Delivery App"
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}


extension HomeViewController: UISearchBarDelegate {
    
}
