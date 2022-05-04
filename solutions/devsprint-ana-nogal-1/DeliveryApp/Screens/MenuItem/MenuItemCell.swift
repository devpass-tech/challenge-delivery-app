//
//  MenuItemCell.swift
//  DeliveryApp
//
//  Created by Cora on 02/05/22.
//

import UIKit

struct MenuItemCellConfiguration {
    var itemTitle: String
    var itemCost: String
}

final class MenuItemCell: UITableViewCell {

    static let identifier = "MenuItemCell"
     
     private lazy var stackViewCell: UIStackView = {
         let stack = UIStackView()
         stack.axis = .vertical
         stack.alignment = .center
         stack.spacing = 0
         stack.translatesAutoresizingMaskIntoConstraints = false
         return stack
     }()
     
     lazy var itemTitle: UILabel = {
         let title = UILabel()
         title.font = .systemFont(ofSize: 15, weight: .regular)
         title.translatesAutoresizingMaskIntoConstraints = false
         return title
     }()
     
     lazy var itemCost: UILabel = {
         let cost = UILabel()
         cost.font = .systemFont(ofSize: 13)
         cost.textColor = UIColor.lightGray
         cost.translatesAutoresizingMaskIntoConstraints = false
         return cost
     }()
    
    lazy var itemImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "pizza"))
        image.layer.cornerRadius = 14
        image.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
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
         addSubview(stackViewCell)
         [itemTitle,itemCost].forEach(stackViewCell.addArrangedSubview)
         addSubview(itemImage)
     }
     
     func setupConstraints() {
         NSLayoutConstraint.activate([
            stackViewCell.trailingAnchor.constraint(equalTo: itemImage.leadingAnchor, constant: 32),
            stackViewCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            itemImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
         ])
}
}
