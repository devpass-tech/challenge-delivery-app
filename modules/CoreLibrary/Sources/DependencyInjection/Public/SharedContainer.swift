import Foundation

public func sharedContainer(
    file: StaticString = #file,
    line: UInt = #line
) -> Container {
    let environment = getEnvironment(file: file, line: line)
    return environment.globalServiceLocator
}
