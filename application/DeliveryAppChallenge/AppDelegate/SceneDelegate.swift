import UIKit
import Navigation
import Restaurants
import Home

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        registerFeatures()

        guard let windowScene = (scene as? UIWindowScene),
              let rootViewController = try? RouterService.shared.controller(for: HomeRoute()) else { return }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        self.window?.rootViewController = navigationController
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
    
    private func registerFeatures() {
        HomeFeature.bootstrap()
        RestaurantFeature.bootstrap()
    }
}

