//
//  AddressSearchViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

protocol AddressSearchViewControllerProtol {
    
}

class AddressSearchViewController: UIViewController, AddressSearchViewControllerProtol {

    var addressListView = AddressListView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        addressListView.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = addressListView
    }
}
