//
//  EmptyView.swift
//  DeliveryApp
//
//  Created by Luiza on 26/04/22.
//
import UIKit

final class EmptyView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Endereço não encontrado"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Procure por ruas com número e bairro utilizando o campo de busca"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor.lightGray
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 15
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
}

extension EmptyView: ViewConfiguration {
    internal func configViews() {
        backgroundColor = .white
    }

    internal func buildViews() {
        addSubview(stackView)
        [titleLabel, subtitleLabel].forEach(stackView.addArrangedSubview)
    }

    internal func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
