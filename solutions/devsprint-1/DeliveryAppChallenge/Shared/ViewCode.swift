//
//  ViewCode.swift
//  DeliveryAppChallenge
//
//  Created by Bruna Fernanda Drago on 02/11/21.
//

import Foundation

protocol ViewCode {
    
    func setup()
    
    func setupComponents()
    
    func setupConstraints()
    
    func setupExtraConfiguration()
}

extension ViewCode {
    
    func setup() {
        setupComponents()
        setupConstraints()
        setupExtraConfiguration()
    }
    
    func setupExtraConfiguration(){}
}
