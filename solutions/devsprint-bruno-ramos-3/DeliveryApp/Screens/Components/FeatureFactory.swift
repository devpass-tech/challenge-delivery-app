//
//  FeatureFactory.swift
//  DeliveryApp
//
//  Created by Sara Batista dos Santos Felix (P) on 16/02/22.
//

import UIKit

protocol FeatureFactory {
    associatedtype Dependencies
    
    static func make(with dependencies: Dependencies) -> UIViewController
}
