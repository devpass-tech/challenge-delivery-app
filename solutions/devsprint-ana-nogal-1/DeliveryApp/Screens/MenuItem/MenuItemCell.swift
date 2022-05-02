//
//  MenuItemCell.swift
//  DeliveryApp
//
//  Created by Cora on 28/04/22.
//

import UIKit

struct MenuItemCellConfiguration {
    var itemName: String
    var itemValue: String
    var itemImage: UIImage
}

class MenuItemCell: UITableViewCell {
    
    static let identifier = "menuItemCell"
    
    private lazy var itemName: UILabel = {
        var name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var itemValue: UILabel = {
        var value = UILabel()
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    private lazy var itemImage: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        //image.clipsToBounds = true
        //image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with configuration: MenuItemCellConfiguration) {
        itemName.text = configuration.itemName
        itemValue.text = configuration.itemValue
        itemImage.image = configuration.itemImage
    }
}

//    extension MenuItemCell: ViewConfiguration {
//        func configureSubviews() {
//            addSubview(stackView)
//    }
//
//    func configureSubviewsConstraints() {
//        NSLayoutConstraint.activate([
//            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 15)])
//    }
//}
