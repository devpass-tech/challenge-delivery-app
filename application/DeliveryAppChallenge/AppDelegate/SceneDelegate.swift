import UIKit
import Navigation
import Networking
import Services
import Home
import Restaurants
import DependencyInjection

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    @Resolved var navigationService: NavigationService
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        registerCores()
        registerFeatures()

        let homeRoute: HomeRoute = .init(source: .appStart)
        guard
            let windowScene = (scene as? UIWindowScene),
            let rootViewController = try? navigationService.controller(for: homeRoute)
        else { return }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        self.window?.rootViewController = navigationController
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
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

