//
//  DividerView.swift
//  DeliveryAppChallenge
//
//  Created by Gabriel on 03/11/21.
//

import Foundation
import UIKit

public class DividerView: UIView {
    
     lazy var dividerView: UIView = {
        let dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        return dividerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
      }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DividerView: ViewCode {
    
    func setupComponents() {
        addSubview(dividerView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
              dividerView.heightAnchor.constraint(equalToConstant: 1),
          
            ])
    }
    
    func setupExtraConfiguration() {
        dividerView.backgroundColor = .lightGray
    }

}
