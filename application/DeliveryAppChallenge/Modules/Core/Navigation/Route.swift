//
//  Route.swift
//  DeliveryAppChallenge
//
//  Created by Gustavo Soares on 29/06/22.
//

import Foundation
import UIKit

typealias RouterIdentifier = String

// MARK: Markable type
protocol PresentationStyle {}

protocol Route {
    static var identifier: RouterIdentifier { get }
    var presentationStyle: PresentationStyle { get }
}

struct PushPresentationStyle: PresentationStyle {
    let animated: Bool

    init(animated: Bool = true) {
        self.animated = animated
    }
}

struct PresentPresentationStyle: PresentationStyle {
    let animated: Bool
    let completion: (() -> Void)?

    init(
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        self.animated = animated
        self.completion = completion
    }
}
