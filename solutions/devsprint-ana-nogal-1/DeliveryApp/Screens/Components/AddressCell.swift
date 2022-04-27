//
//  AddressCell.swift
//  DeliveryApp
//
//  Created by Cora on 27/04/22.
//

import UIKit

class AddressCell: UITableViewCell {

   static let identifier = "AdressCell"
    
    lazy var stackViewCell: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 15, weight: .semibold)
        title.text = "Rua Bela Cintra, 495"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var subTitle: UILabel = {
        let subTitle = UILabel()
        subTitle.font = .systemFont(ofSize: 13)
        subTitle.text = "Consolação"
        subTitle.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        return subTitle
    }()
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configViews()
        buildViews()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        title.text = nil
        subTitle.text = nil
    }
    
    //MARK: - ViewConfiguration
    func configViews() {
    }
    
    func buildViews(){
        [stackViewCell].forEach(contentView.addSubview)
        [title,subTitle].forEach(stackViewCell.addArrangedSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackViewCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.5),
            stackViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23.5),
            stackViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23.5),
            stackViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16.5),
        ])
    }
}