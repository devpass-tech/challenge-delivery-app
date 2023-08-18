import Foundation

public func register<T>(
    instance: T,
    forMetaType metaType: T.Type,
    file: StaticString = #file,
    line: UInt = #line
) {
    getEnvironment(
        file: file,
        line: line
    ).globalServiceLocator.register(
        instance: instance,
        forMetaType: metaType
    )
}

public func register<T>(
    factory: @escaping (Resolver) -> T,
    forMetaType metaType: T.Type,
    file: StaticString = #file,
    line: UInt = #line
) {
    getEnvironment(
        file: file,
        line: line
    ).globalServiceLocator.register(
        factory: factory,
        forMetaType: metaType
    )
}
