import UIKit
import Navigation
import Restaurants

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        registerFeatures()

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let viewController = HomeFactory.make(with: .init())
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        self.window?.rootViewController = navigationController
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
    
    private func registerFeatures() {
        RestaurantsFeature.bootstrap()
    }
}

