//
//  RestaurantListView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 04/02/22.
//

import UIKit

class RestaurantMenuListViewCell: UITableViewCell {
    
    static let cellIdentifier = "RestaurantMenuListViewCell"
    
    private lazy var iconImageView: UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: "restaurant-logo", in: Bundle(for: RestaurantMenuListViewCell.self), compatibleWith: nil))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        imageView.layer.cornerRadius = 14
        imageView.clipsToBounds = true

        return imageView
    }()
   
    private lazy var titleLabel: UILabel  = {
        
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    private lazy var priceLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "R$ 12.00"
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: RestaurantMenuListViewCell.cellIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents() {
       
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(priceLabel)
        
    }
    
    func setupContraints(){
        
        NSLayoutConstraint.activate([
        
            iconImageView.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            iconImageView.topAnchor.constraint(equalTo: topAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: trailingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: 13),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
        ])
    }
    
    func setupExtraConfiguration(){
        
    }
    
}

extension RestaurantMenuListViewCell {
    
    func setup(){
        setupComponents()
        setupContraints()
        setupExtraConfiguration()
    }
    
}
