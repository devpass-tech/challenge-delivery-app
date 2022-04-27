//
//  AddressSearchViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class AddressSearchViewController: UIViewController {

   private let addressListView = AddressListView()
    
    
   private lazy var searchController: UISearchController = {
    let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Rua, número, bairro"
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchController
        
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }

    override func loadView() {
        self.view = addressListView
    }
    
    private func setup() {
        navigationItem.title = "Search"
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    }
    
}

extension AddressSearchViewController:  UISearchBarDelegate {
    
}
