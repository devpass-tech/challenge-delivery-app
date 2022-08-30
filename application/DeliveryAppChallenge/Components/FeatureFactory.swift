//
//  FeatureFactory.swift
//  DeliveryAppChallenge
//
//  Created by Bruna Fernanda Drago on 05/11/21.
//

import UIKit

/// Este protocolo deve ser implementado na construção de toda feature do App.
protocol FeatureFactory {
    
    associatedtype Dependencies
    
    /// Este método vai construir a UIViewController da feature
    /// - Returns: ele recebe uma Dependencies que é do tipo genérica e pode ser usada para passar dados/informações de uma tela para outra
    static func make(with dependecies: Dependencies) -> UIViewController
}
