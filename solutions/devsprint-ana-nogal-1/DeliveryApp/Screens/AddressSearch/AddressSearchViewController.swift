//
//  AddressSearchViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

protocol AddressSearchViewControllerProtocol {
    func updateAddress(address: [Address])
}

class AddressSearchViewController: UIViewController,  AddressSearchViewControllerProtocol {

    var addressListView = AddressListView()
    var delegate: AddressListViewProtocol?
    var service = DeliveryApi()
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        addressListView.delegate = self
        service.delegate = self
        service.getAdresses()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = addressListView
    }

    func updateAddress( address : [Address]) {
//        DispatchQueue.main.async {
//            print("Entrei no main async")
//            self.addressListView.updateAddress(with: address)
//        }
        addressListView.updateAddress(with: address)
//        delegate?.updateAddress(with: address)
        print("Entrei")
    }
}
