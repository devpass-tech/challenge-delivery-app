import Foundation

public protocol ViewCode {
    func setup()
    func setupComponents()
    func setupConstraints()
    func setupExtraConfiguration()
}

extension ViewCode {
    public func setup() {
        setupComponents()
        setupConstraints()
        setupExtraConfiguration()
    }
    public func setupExtraConfiguration() {}
}
