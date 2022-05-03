//
//  RestaurantCell.swift
//  DeliveryApp
//
//  Created by Cora on 27/04/22.
//

import UIKit

struct RestaurantCellConfiguration {
     var title: String
     var subtitle: String
 }

class RestaurantCell: UITableViewCell {
    
    static let identifier = "RestaurantCellIdentifier"

    lazy var image: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(imageLiteralResourceName: "restaurant-logo")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.tintColor = UIColor.lightText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         configViews()
         buildViews()
         setupConstraints()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
         title.text = nil
         subtitle.text = nil
     }
    
    func updateView(with configuration: RestaurantCellConfiguration){

         title.text = configuration.title
         subtitle.text = configuration.subtitle
     }
    
    //MARK: View Configuration
    func configViews() {
        backgroundColor = .white
    }
    
    func buildViews() {
        [image, title, subtitle].forEach(addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            
            subtitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor)
        ])
    }
}

