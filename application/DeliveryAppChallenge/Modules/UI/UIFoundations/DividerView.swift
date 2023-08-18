//
//  DividerView.swift
//  DeliveryAppChallenge
//
//  Created by Gabriel on 03/11/21.
//

import Foundation
import UIKit

final class DividerView: UIView {
    private let dividerView: UIView = {
        let dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .lightGray
        return dividerView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DividerView: ViewCode {
    func setupComponents() {
        addSubview(dividerView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: topAnchor),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func setupExtraConfiguration() {
        backgroundColor = .white
    }
}
