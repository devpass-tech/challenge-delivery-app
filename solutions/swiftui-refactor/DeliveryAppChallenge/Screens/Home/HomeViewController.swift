//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let deliveryApi: DeliveryApiProtocol
    private let customView: HomeViewProtocol
    
    init(customView: HomeViewProtocol, deliveryApi: DeliveryApiProtocol) {
        self.customView = customView
        self.deliveryApi = deliveryApi
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
        
        deliveryApi.fetchRestaurants { [weak self] restaurants in
            //        self.restaurants = restaurants
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.customView.displayRestaurants(.init(restaurants: restaurants))
            }
        }
    }
}

extension HomeViewController: HomeViewDelegate {
    
}
