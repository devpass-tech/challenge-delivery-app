//
//  FeatureFactory.swift
//  DeliveryApp
//
//  Created by Sara Batista dos Santos Felix (P) on 16/02/22.
//

import UIKit

protocol FeatureFactory {
    associatedtype Dependencies
    
    /// Esta função retorna um view controller construído para determinadas dependências
    
    
    /// - Aviso: nenhum.
    /// - Dependências de parâmetro: Dependências injetadas pelo recurso.
    /// - Returns: Um view controller construído para ser apresentado usando `dependencies`.
    static func make(with dependencies: Dependencies) -> UIViewController
}
