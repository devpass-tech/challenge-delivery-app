import Foundation

public protocol Resolver {
    func resolve<T>(_ metaType: T.Type) -> T?
    func autoResolve<T>() -> T?
}
extension Resolver {
    public func resolveUnsafe<T>(
        _ metaType: T.Type,
        file: StaticString = #file,
        line: UInt = #line
    ) -> T {
        guard let instance = resolve(T.self) else {
            fatalError(
                "Please be sure that \(String(describing: T.self)) was registered.",
                file: file,
                line: line
            )
        }
        return instance
    }
    
    public func autoResolveUnsafe<T>(
        file: StaticString = #file,
        line: UInt = #line
    ) -> T {
        guard let instance: T = autoResolve() else {
            fatalError(
                "Please be sure that \(String(describing: T.self)) was registered.",
                file: file,
                line: line
            )
        }
        return instance
    }
}
