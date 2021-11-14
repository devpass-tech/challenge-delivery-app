//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let restaurantListDataSource: RestaurantListDataSourceProtocol
    private let customView: HomeViewProtocol
    
    init(customView: HomeViewProtocol, restaurantListDataSource: RestaurantListDataSourceProtocol) {
        self.customView = customView
        self.restaurantListDataSource = restaurantListDataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Delivery App"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchRestaurants()
    }
    
    func fetchRestaurants() {
        
        restaurantListDataSource.fetchRestaurantList { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let restaurants):
                    self.customView.displayRestaurants(.init(restaurants: restaurants))
                case .failure:
                    print("Tratar erro na view")
                }
                
            }
        }
    }
}

extension HomeViewController: HomeViewDelegate {
    
}
