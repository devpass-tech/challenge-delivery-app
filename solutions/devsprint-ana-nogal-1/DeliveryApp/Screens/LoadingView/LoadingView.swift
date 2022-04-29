//
//  LoadingView.swift
//  DeliveryApp
//
//  Created by Luiza on 26/04/22.
//

import UIKit

struct LoadingViewConfiguration {
    var title: String
}

final class LoadingView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 14
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configViews()
        buildViews()
        setupConstraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with configuration: LoadingViewConfiguration) {
            titleLabel.text = configuration.title
    }
}

extension LoadingView: ViewConfiguration {
    internal func configViews() {
        backgroundColor = .white
    }

    internal func buildViews() {
        addSubview(stackView)
        [titleLabel, activityIndicator].forEach(stackView.addArrangedSubview)
    }

    internal func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}


