import DependencyInjection
import Foundation

public func bootstrap() {
    DependencyInjection.register(
        instance: NavigationServiceImplementation(),
        forMetaType: NavigationService.self
    )
    DependencyInjection.register(
        factory: { resolver in
            let navigationService = resolver.resolveUnsafe(NavigationService.self)
            return navigationService
        }, forMetaType: AppNavigator.self
    )
    DependencyInjection.register(
        factory: { resolver in
            let navigationService = resolver.resolveUnsafe(NavigationService.self)
            return navigationService
        }, forMetaType: SceneRegistration.self
    )
}
