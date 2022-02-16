//
//  ViewCode.swift
//  DeliveryApp
//
//  Created by Rodrigo Francischett Occhiuto on 14/02/22.
//

/// Protocolo para implementar as funções necessárias em uma View.
protocol ViewCode {
    ///Chamar esta funçao para adicionar as hierarquias das views
    func setupComponents()
    ///Chamar esta funçao  para setar as constraints das views
    func setupConstraints()
    ///Chamar esta funçao para adicionar alguma configuração adicional caso seja necessário
    func setupExtraConfiguration()
    ///Chamar esta função dentro da ViewDidLoad da View para implementar as configurações da extension ViewCode
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
