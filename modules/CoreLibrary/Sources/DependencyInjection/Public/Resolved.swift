import Foundation

@propertyWrapper
public final class Resolved<T> {
    // MARK: - Dependencies

    private let resolver: Resolver?
    private let failureHandler: (String) -> Void
    private(set) var resolvedValue: T!

    // MARK: - Properties

    public var wrappedValue: T {
        resolveIfNeeded()
        return resolvedValue!
    }

    // MARK: - Initialization

    public convenience init() {
        self.init(
            resolvedValue: nil,
            resolver: getEnvironment().globalServiceLocator,
            failureHandler: { preconditionFailure($0) }
        )
    }

    fileprivate init(
        resolvedValue: T?,
        resolver: Resolver?,
        failureHandler: @escaping (String) -> Void
    ) {
        self.resolvedValue = resolvedValue
        self.resolver = resolver
        self.failureHandler = failureHandler
    }

    // MARK: - Private Functions

    private func resolveIfNeeded() {
        guard resolvedValue == nil else {
            failureHandler("\(type(of: self)) shouldn't be resolved twice!")
            return
        }
        guard let instanceFromContainer = resolver?.resolve(T.self) else {
            failureHandler("Could not resolve \(type(of: self)), check it it was registered!")
            return
        }
        resolvedValue = instanceFromContainer
    }
}

#if DEBUG
    public extension Resolved {
        convenience init(resolvedValue: T) {
            self.init(
                resolvedValue: resolvedValue,
                resolver: nil,
                failureHandler: { _ in }
            )
        }
    }
#endif
