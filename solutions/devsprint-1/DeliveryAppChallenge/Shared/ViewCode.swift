//
//  ViewCode.swift
//  DeliveryAppChallenge
//
//  Created by Bruna Fernanda Drago on 02/11/21.
//

import Foundation

/// Este protocolo implementa as funções necessárias para a construção de uma View.
protocol ViewCode {
    
    /// Esta função deverá ser chamada no método viewDidLoad para implementar o código da extension
    func setup()
    
    /// Esta função deverá ser usada para adicionar a hierárquia de subviews
    func setupComponents()
    
    func setupConstraints()
    
    /// Esta função deverá ser usada para implementar configurações adicionais , como acessibilidade, cor, targets
    func setupExtraConfiguration()
}

extension ViewCode {
    
    func setup() {
        setupComponents()
        setupConstraints()
        setupExtraConfiguration()
    }
    
    func setupExtraConfiguration() {}
}
