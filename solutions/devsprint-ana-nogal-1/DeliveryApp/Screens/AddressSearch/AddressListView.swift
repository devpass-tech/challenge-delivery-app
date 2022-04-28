//
//  AddressSearchView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 04/02/22.
//

import UIKit

protocol AddressListViewProtocol {
    func updateAddress()
}

class AddressListView: UIView, AddressListViewProtocol {
    
    var delegate: AddressSearchViewControllerProtol?
    // fake , still need a model to full implement this code
    private var adresses: [String]
    
    private lazy var tableView: UITableView = {
       let tableView  = UITableView()
        tableView.register(AddressCell.self, forCellReuseIdentifier: AddressCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - Init
    init(){
        adresses = ["Rua Aurora, 123", "Rua Jorjin, 91", "Rua Morpheus, 44", "Alameda dos Anjos, 137"] // fake temporary data
        
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        setupConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateAddress() {
        
    }
    
    //MARK: - SetupView
    func configViews(){
    }
    
    func buildViews() {
        
        [tableView].forEach(addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension AddressListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let address = adresses[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: AddressCell.identifier, for: indexPath) as! AddressCell
        cell.title.text = address
        cell.subTitle.text = address
        return cell
    }
    
}

extension AddressListView: UITableViewDelegate {
    
}
