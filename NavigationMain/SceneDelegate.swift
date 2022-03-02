
import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        
        let tabBarController = UITabBarController ()
        tabBarController.tabBar.backgroundColor = .white
        
        let feedViewController = FeedViewController()
        feedViewController.view.backgroundColor = UIColor.white
        let feedNavController = UINavigationController(rootViewController: feedViewController)

        let profileViewController = ProfileViewController()
        profileViewController.view.backgroundColor = .lightGray
        let profilNavController = UINavigationController(rootViewController: profileViewController)
        
        let logInViewContoller = LogInViewController()
        logInViewContoller.view.backgroundColor = .white
        let logInNavController = UINavigationController(rootViewController: logInViewContoller)
        
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        feedNavController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "text.justify"), tag: 0)
        feedNavController.navigationBar.barTintColor = UIColor.white
        feedNavController.navigationBar.standardAppearance = appearance
        feedNavController.navigationBar.scrollEdgeAppearance = feedNavController.navigationBar.standardAppearance

        
        logInNavController.tabBarItem = UITabBarItem( title: "Profile", image: UIImage(systemName: "person"), tag: 0)
        logInNavController.navigationBar.barTintColor = UIColor.white
        logInNavController.navigationBar.standardAppearance = appearance
        logInNavController.navigationBar.scrollEdgeAppearance = logInNavController.navigationBar.standardAppearance
        logInNavController.navigationBar.isHidden = true

        tabBarController.viewControllers = [logInNavController, feedNavController]

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
        
    }
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

