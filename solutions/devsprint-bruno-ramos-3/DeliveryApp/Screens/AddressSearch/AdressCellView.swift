//
//  AdressCellView.swift
//  DeliveryApp
//
//  Created by Pedro Henrique Léda on 15/02/22.
//

import Foundation
import UIKit

class AdressCellView: UITableViewCell {
    var stackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
}
