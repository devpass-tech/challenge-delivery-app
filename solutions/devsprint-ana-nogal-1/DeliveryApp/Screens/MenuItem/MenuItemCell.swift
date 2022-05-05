//
//  MenuItemCell.swift
//  DeliveryApp
//
//  Created by Luiza on 02/05/22.
//

import UIKit

struct MenuItemCellConfiguration {
    var itemTitle: String
    var itemCost: String
}

final class MenuItemCell: UITableViewCell {

    static let identifier = "MenuItemCell"
     
     lazy var itemTitle: UILabel = {
         let title = UILabel()
         title.font = .systemFont(ofSize: 15, weight: .regular)
         title.numberOfLines = 0
         title.translatesAutoresizingMaskIntoConstraints = false
         return title
     }()
     
     lazy var itemCost: UILabel = {
         let cost = UILabel()
         cost.font = .systemFont(ofSize: 13)
         cost.textColor = UIColor.gray
         cost.numberOfLines = 0
         cost.translatesAutoresizingMaskIntoConstraints = false
         return cost
     }()
    
    lazy var itemImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "pizza"))
        image.layer.cornerRadius = 14
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
     
     //MARK: - Init
    
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         configViews()
         buildViews()
         setupConstraints()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
    func updateView(with configuration: MenuItemCellConfiguration) {
        itemTitle.text = configuration.itemTitle
        itemCost.text = configuration.itemCost
    }
    
     //MARK: - ViewConfiguration
     
    func configViews() {
        backgroundColor = .white
     }
     
     func buildViews(){
         [itemTitle,itemCost, itemImage].forEach(addSubview)
     }
     
     func setupConstraints() {
         NSLayoutConstraint.activate([
        
            itemCost.topAnchor.constraint(equalTo: centerYAnchor),
            itemCost.leadingAnchor.constraint(equalTo: itemTitle.leadingAnchor),
            
            itemTitle.bottomAnchor.constraint(equalTo: centerYAnchor),
            itemTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            itemTitle.trailingAnchor.constraint(equalTo: itemImage.leadingAnchor, constant: -12),
            
            itemImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            itemImage.heightAnchor.constraint(equalToConstant: 64),
            itemImage.widthAnchor.constraint(equalToConstant: 64),
            itemImage.centerYAnchor.constraint(equalTo: centerYAnchor)
         ])
     }
}
