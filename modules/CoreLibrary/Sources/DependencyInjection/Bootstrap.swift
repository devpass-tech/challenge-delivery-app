import Foundation

struct Environment {
    var globalServiceLocator: ServiceLocatorInterface
}

var environment: Environment?

func getEnvironment(
    file: StaticString = #file,
    line: UInt = #line
) -> Environment {
    guard let environment else {
        fatalError("`bootstrap` was never called!", file: file, line: line)
    }
    return environment
}

public func bootstrap() {
    guard environment == nil else {
        fatalError("Environment can only be set up once!")
    }
    environment = .init(
        globalServiceLocator: ServiceLocator()
    )
}
