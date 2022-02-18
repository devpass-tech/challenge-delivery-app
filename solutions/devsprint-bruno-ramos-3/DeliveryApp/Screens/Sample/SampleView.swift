//
//  SampleView.swift
//  DeliveryApp
//
//  Created by Bruno Henrique Costa Ramos on 14/02/22.
//

import UIKit

protocol ViewCode {
    func setupComponents()
    func setupConstraints()
    func setupExtraConfiguration()
    func setup()
}

extension ViewCode {
    func setup() {
        setupComponents()
        setupConstraints()
        setupExtraConfiguration()
    }

    func setupExtraConfiguration() {}
}


protocol SampleViewDelegate: AnyObject {
    func didTapOnSomeButton()
}

protocol SampleViewProtocol: UIView {
    var delegate: SampleViewDelegate? { get set }

    func display(viewModel: [SampleView.ViewModel])
}

final class SampleView: UIView, SampleViewProtocol {
    weak var delegate: SampleViewDelegate?

    private var viewModel: [ViewModel] = [] {
        didSet {
            reloadData()
        }
    }

    struct ViewModel {
        let name: String
        let address: String
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let fooButton: UIButton = {
        let button = UIButton()
        return button
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func reloadData() {
        tableView.reloadData()
    }

    func display(viewModel: [ViewModel]) {
        self.viewModel = viewModel
        tableView.reloadData()
    }

    @objc private func didTapOnButton() {
        delegate?.didTapOnSomeButton()
    }
}

extension SampleView: ViewCode {
    func setupComponents() {
        addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

extension SampleView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
