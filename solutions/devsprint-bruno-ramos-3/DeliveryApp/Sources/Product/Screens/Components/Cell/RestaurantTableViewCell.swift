//
//  RestaurantTableViewCell.swift
//  DeliveryApp
//
//  Created by Diogo Gaspar on 15/02/22.
//

import UIKit

final class RestaurantTableViewCell: UITableViewCell {
    
    struct ViewModel {
        let urlImage: String
        let name: String
        let category: String
        let deliveryTimeMin: Int
        let deliveryTimeMax: Int
    }
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private lazy var restaurantLogo: UIImageView = {
		let logo = UIImageView()
		logo.translatesAutoresizingMaskIntoConstraints = false
		logo.contentMode = .scaleAspectFill
		logo.clipsToBounds = true
		logo.layer.masksToBounds = true
		logo.layer.cornerRadius = 24
		
		return logo
	}()
	
	private lazy var restaurantLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .label
		label.font = .boldSystemFont(ofSize: 15)
		
		return label
	}()
	
	public lazy var restaurantType: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .secondaryLabel
		label.font = .systemFont(ofSize: 13)
		
		return label
	}()
	
	public lazy var deliveryTimeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .secondaryLabel
		label.font = .systemFont(ofSize: 13)
		
		return label
	}()
}

extension RestaurantTableViewCell: ViewCode {
	func setupComponents() {
		addSubview(restaurantLogo)
		addSubview(restaurantLabel)
		addSubview(restaurantType)
		addSubview(deliveryTimeLabel)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			contentView.heightAnchor.constraint(equalToConstant: 60)
		])
		
		NSLayoutConstraint.activate([
			restaurantLogo.centerYAnchor.constraint(equalTo: centerYAnchor),
			restaurantLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 23),
			restaurantLogo.heightAnchor.constraint(equalToConstant: 48),
			restaurantLogo.widthAnchor.constraint(equalToConstant: 48)
		])
		
		NSLayoutConstraint.activate([
			restaurantLabel.centerYAnchor.constraint(equalTo: restaurantLogo.centerYAnchor, constant: -10),
			restaurantLabel.leadingAnchor.constraint(equalTo: restaurantLogo.trailingAnchor, constant: 10)
		])
		
		NSLayoutConstraint.activate([
			restaurantType.centerYAnchor.constraint(equalTo: restaurantLogo.centerYAnchor, constant: 10),
			restaurantType.topAnchor.constraint(equalTo: restaurantLabel.bottomAnchor, constant: 5),
			restaurantType.leadingAnchor.constraint(equalTo: restaurantLabel.leadingAnchor)
		])
		
		NSLayoutConstraint.activate([
			deliveryTimeLabel.centerYAnchor.constraint(equalTo: restaurantLogo.centerYAnchor, constant: 10),
			deliveryTimeLabel.topAnchor.constraint(equalTo: restaurantLabel.bottomAnchor, constant: 5),
			deliveryTimeLabel.leadingAnchor.constraint(equalTo: restaurantType.trailingAnchor)
		])
	}
	
	func setupExtraConfiguration() {
		self.accessoryType = .disclosureIndicator
	}
    
    func display(viewModel: ViewModel) {
        restaurantLabel.text = viewModel.name
        restaurantType.text = viewModel.category
        deliveryTimeLabel.text = "\(viewModel.deliveryTimeMin) . \(viewModel.deliveryTimeMax)"
    }
}


