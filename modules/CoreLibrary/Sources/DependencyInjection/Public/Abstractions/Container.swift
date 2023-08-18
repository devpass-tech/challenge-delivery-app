import Foundation

public protocol Container {
    func register<T>(instance: T, forMetaType metaType: T.Type)
    func register<T>(
        factory: @escaping (Resolver) -> T,
        forMetaType metaType: T.Type
    )
}

extension Container {
    func register<T>(
        factory: @escaping () -> T,
        forMetaType metaType: T.Type
    ) {
        register(
            factory: { _ in factory() },
            forMetaType: metaType
        )
    }
}
