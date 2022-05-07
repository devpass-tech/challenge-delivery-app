//
//  CategoryCell.swift
//  DeliveryApp
//
//  Created by Anderson Oliveira on 04/05/22.
//

import Foundation
import UIKit

class CategoryCell: UICollectionViewCell, ViewConfiguration {
    
    static var identifier = "CategoryCell"
    
    private lazy var categoryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var categoryImage: UIImageView = {
        let catImage = UIImageView()
        catImage.layer.masksToBounds = true
        catImage.layer.cornerRadius = 14
        return catImage
    }()
    
    lazy var categoryLabel: UILabel = {
        let catLabel = UILabel()
        catLabel.textAlignment = .center
        catLabel.font = .systemFont(ofSize: 12)
        catLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        return catLabel
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
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
        [categoryImage,categoryLabel].forEach(addSubview)
    }
    
    func setupConstraints() {
        [categoryStackView,categoryLabel,categoryImage].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            categoryImage.topAnchor.constraint(equalTo: topAnchor),
            categoryImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2.5),
            categoryImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2.5),
          
            categoryLabel.topAnchor.constraint(equalTo: categoryImage.bottomAnchor, constant: 10),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            categoryImage.heightAnchor.constraint(equalToConstant: 54),
        ])
    }
}
