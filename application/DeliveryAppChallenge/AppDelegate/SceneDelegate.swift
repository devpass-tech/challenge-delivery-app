import DependencyInjection
import Home
import Navigation
import Networking
import Restaurants
import Services
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    @Resolved var navigationService: NavigationService
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        registerCores()
        registerFeatures()

        let homeRoute: HomeRoute = .init(source: .appStart)
        guard
            let windowScene = (scene as? UIWindowScene),
            let rootViewController = try? navigationService.controller(for: homeRoute)
        else { return }

        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = navigationController
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }

    private func registerCores() {
        DependencyInjection.bootstrap()
        Navigation.bootstrap()
        Networking.bootstrap(
            baseURL: URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/")!
        )
        Services.bootstrap()
    }

    private func registerFeatures() {
        HomeFeature.bootstrap()
        RestaurantFeature.bootstrap()
    }
}
