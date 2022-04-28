//
//  RestaurantCell.swift
//  DeliveryApp
//
//  Created by Cora on 27/04/22.
//

import UIKit

class RestaurantCell: UITableViewCell {
    
    static let identifier = "restaurantCell"

    lazy var image: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(imageLiteralResourceName: "restaurant-logo")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Benjamin a Padaria"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitle: UILabel = {
        let label = UILabel()
        label.text = "Padaria • 23-33 min"
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
    
    //MARK: View Configuration
    func configViews() {
        
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
