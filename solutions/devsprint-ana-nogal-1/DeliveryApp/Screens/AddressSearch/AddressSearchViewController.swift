//
//  AddressSearchViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit
//NO ULTIMO COMMIT, Não upar este arquivo!!!!!!!!!!
//NO ULTIMO COMMIT, Não upar este arquivo!!!!!!!!!! ( só pra reforçar '-' )
class AddressSearchViewController: UIViewController {

    let service = DeliveryApi()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        service.getAddresses()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = AddressListView()
    }
}
