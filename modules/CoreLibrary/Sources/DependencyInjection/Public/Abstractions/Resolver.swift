import Foundation

public protocol Resolver {
    func resolve<T>(_ metaType: T.Type) -> T?
    func autoResolve<T>() -> T?
}

public extension Resolver {
    func resolveUnsafe<T>(
        _: T.Type,
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

    func autoResolveUnsafe<T>(
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
