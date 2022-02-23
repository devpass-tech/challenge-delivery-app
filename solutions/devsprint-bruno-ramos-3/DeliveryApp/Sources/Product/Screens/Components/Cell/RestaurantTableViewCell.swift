//
//  RestaurantTableViewCell.swift
//  DeliveryApp
//
//  Created by Diogo Gaspar on 15/02/22.
//

import UIKit

//MARK: -> Deletar meu mock quando implementar Data
struct DummyData {
	let imageLogo: UIImage = #imageLiteral(resourceName: "restaurant-logo")
	let name: String = "Restaurant Name"
	let type: String = "Restaurant Type"
	let deliveryTime: DummyDeliveryTime = DummyDeliveryTime()
}

struct DummyDeliveryTime {
	let min: Int = 1
	let max: Int = 10
}

final class RestaurantTableViewCell: UITableViewCell {
	
	let dummyData: DummyData = DummyData()
	
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
		logo.image = dummyData.imageLogo // Mock
		logo.contentMode = .scaleAspectFill
		logo.clipsToBounds = true
		logo.layer.masksToBounds = true
		logo.layer.cornerRadius = 24
		
		return logo
	}()
	
	private lazy var restaurantLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = dummyData.name // Mock
		label.textColor = .label
		label.font = .boldSystemFont(ofSize: 15)
		
		return label
	}()
	
	public lazy var restaurantType: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "\(dummyData.type) · " // Mock
		label.textColor = .secondaryLabel
		label.font = .systemFont(ofSize: 13)
		
		return label
	}()
	
	public lazy var deliveryTimeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "\(dummyData.deliveryTime.min) - \(dummyData.deliveryTime.max) min" // Mock
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
}
