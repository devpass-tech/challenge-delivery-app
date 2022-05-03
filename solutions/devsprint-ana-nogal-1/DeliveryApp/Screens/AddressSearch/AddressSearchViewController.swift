//
//  AddressSearchViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

protocol AddressSearchViewControllerProtocol: AnyObject {
    func updateAddress()
}

final class AddressSearchViewController: UIViewController, AddressSearchViewControllerProtocol {
    
   private let addressListView = AddressListView()
    weak var delegate: AddressListViewProtocol?
    var service: DeliveryApiProtocol?
    
   private lazy var searchController: UISearchController = {
    let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Rua, número, bairro"
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchController
    }()
    
    init(service: DeliveryApiProtocol = DeliveryApi()) {
        super.init(nibName: nil, bundle: nil)
        addressListView.delegate = self
        self.service = service
        self.service?.searchControllerDelegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateAddress() {
        service?.getAdresses({ address in
            DispatchQueue.main.async {
                self.addressListView.updateAddress(with: address)
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        updateAddress()
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

extension AddressSearchViewController:  UISearchBarDelegate { }
