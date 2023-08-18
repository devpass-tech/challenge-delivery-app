import DependencyInjection
import ServicesInterface

public func bootstrap() {
    DependencyInjection.register(
        factory: { _ in
            DeliveryClient()
        },
        forMetaType: DeliveryClientProtocol.self
    )
}
