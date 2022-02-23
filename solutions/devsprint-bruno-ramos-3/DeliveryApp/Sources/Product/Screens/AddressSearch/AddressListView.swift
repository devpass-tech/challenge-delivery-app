//
//  AddressSearchView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 04/02/22.
//

import UIKit


// MARK: Protocols

protocol AddressListViewDelegate: AnyObject {
    func didTapOnSomeButton()
}

protocol AddressListViewProtocol: UIView {
    var delegate: AddressListViewDelegate? { get set }
    func display(viewModel: [AddressListView.ViewModel])
}


final class AddressListView: UIView, AddressListViewProtocol {
    
    // MARK: Properts
    weak var delegate: AddressListViewDelegate?
    
    struct ViewModel {
        let address: String
        let name: String
    }
    
    private let cellIdentifier = "addressListCellIdentifier"
    private var viewModel : [ViewModel] = [] {
        didSet {
            reloadData()
        }
    }
    
    // MARK: Components
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(AddressCellView.self, forCellReuseIdentifier: cellIdentifier)
        return tableView
    }()
    
    private func reloadData(){
        self.tableView.reloadData()
    }
    
    func display(viewModel: [ViewModel]) {
        self.viewModel = viewModel
    }
    
    // MARK: Initilizer
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Constraints

extension AddressListView: ViewCode {
    func setupComponents() {
        addSubview(tableView)
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

// MARK: TableViewDelegate and TableViewDataSource

extension AddressListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AddressCellView
        let model = viewModel[indexPath.row]
        cell.setProperties(model);
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
