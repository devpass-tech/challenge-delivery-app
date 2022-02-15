//
//  ViewCode.swift
//  DeliveryApp
//
//  Created by Rodrigo Francischett Occhiuto on 14/02/22.
//

import UIKit

protocol ViewCode {
    func setupComponents()
    func setupConstraints()
    func setupExtraConfiguration()
    func setup()
}

extension ViewCode {
    func setup() {
        setupComponents()
        setupConstraints()
        setupExtraConfiguration()
    }

    func setupExtraConfiguration() {}
}
