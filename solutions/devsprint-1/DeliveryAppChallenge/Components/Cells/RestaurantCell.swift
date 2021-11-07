//
//  RestaurantCell.swift
//  DeliveryAppChallenge
//
//  Created by Edson Neto on 04/11/21.
//

import UIKit

class RestaurantCell: UITableViewCell{
    static let identifier = "RestaurantCellIdentifier"
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let restaurantLogo: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = #imageLiteral(resourceName: "restaurant-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.layer.cornerRadius = 30
        logoImageView.clipsToBounds = true
        return logoImageView
    }()
    

    
}

extension RestaurantCell: ViewCode{
    
    func setupComponents() {
        self.accessoryType = .disclosureIndicator
        
        contentView.addSubview(restaurantLogo)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            restaurantLogo.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            restaurantLogo.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            restaurantLogo.widthAnchor.constraint(equalToConstant: 60),
            restaurantLogo.heightAnchor.constraint(equalToConstant: 60),
            
            
        ])
    }
    
}
