//
//  AddressSearchViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class AddressSearchViewController: UIViewController {
    
    private let searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Rua, número, bairro"
        search.hidesNavigationBarDuringPresentation = false
        return search
    }()

    private let customView: AddressListViewProtocol
    
    
    init(customView: AddressListViewProtocol) {
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = customView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    func setupNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Search"
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}


extension AddressSearchViewController: AddressListViewDelegate {
    func didTapOnSomeButton() {
        //code
    }
}
