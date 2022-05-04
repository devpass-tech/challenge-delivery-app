//
//  CategoryCell.swift
//  DeliveryApp
//
//  Created by Cora on 04/05/22.
//

import Foundation
import UIKit

final class CategoryCell: UITableViewCell, ViewConfiguration {
   
    static var identifier = "CategoryCell"
    
    private lazy var categoryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var categoryImage: UIImageView = {
       let catImage = UIImageView()
        catImage.image = UIImage(named: "pizza")
        return catImage
    }()
    
    private lazy var categoryLabel: UILabel = {
       let catLabel = UILabel()
        catLabel.text = "Pizza"
        return catLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(imageName: String, category: String){
        categoryImage.image = UIImage(named: imageName)
        categoryLabel.text = category
    }
    
    func configViews() { }
    
    func buildViews() {
        [categoryStackView].forEach(addSubview)
        [categoryImage,categoryLabel].forEach(categoryStackView.addArrangedSubview)
    }
    
    func setupConstraints() {
        [categoryStackView,categoryLabel,categoryImage].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            categoryStackView.topAnchor.constraint(equalTo: topAnchor),
            categoryStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            categoryImage.heightAnchor.constraint(equalToConstant: 54),
            categoryImage.widthAnchor.constraint(equalToConstant: 54)
        ])
    }
}
