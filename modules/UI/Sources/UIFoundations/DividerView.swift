import Foundation
import UIKit

public final class DividerView: UIView {
    
    private let dividerView: UIView = {
        let dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .lightGray
        return dividerView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DividerView: ViewCode {
    
    public func setupComponents() {
        addSubview(dividerView)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: topAnchor),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupExtraConfiguration() {
        backgroundColor = .white
    }
}
