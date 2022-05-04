//
//  CategoryListView.swift
//  DeliveryApp
//
//  Created by Cora on 04/05/22.
//

import Foundation
import UIKit

final class CategoryListView: UIView, ViewConfiguration {
    
    
    let num = Category(categoryName: "Futeborrr", categoryImageLabel: "pizza")
    let num2 = Category(categoryName: "Firrrme ", categoryImageLabel: "pizza")
    
    var listCategories: [Category] = []
    
     lazy var tableView: UITableView = {
       let table = UITableView()
        table.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.identifier)
        table.backgroundColor = .lightGray
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        setupViews()
        listCategories = [num, num2]
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configViews() {
        backgroundColor = .white
        print("entri")
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

extension CategoryListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = listCategories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        cell.updateCell(imageName: category.categoryImageLabel, category: category.categoryName)
        return cell
    }
}
