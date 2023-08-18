import DependencyInjection
import Foundation
import NetworkingInterface

struct Environment {
    let baseURL: URL
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

public func bootstrap(
    baseURL: URL
) {
    guard environment == nil else {
        fatalError("Environment can only be set up once!")
    }
    environment = .init(
        baseURL: baseURL
    )
    DependencyInjection.register(
        instance: NetworkManager(),
        forMetaType: NetworkManagerProtocol.self
    )
}
