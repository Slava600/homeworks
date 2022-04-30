
import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    internal var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        
        let loginInspector = MyLoginFactory.shared.returnAuthorization()
        
        let tabBarController = UITabBarController ()
        tabBarController.tabBar.backgroundColor = .white
        
        let feedVC = FeedViewController()
        feedVC.view.backgroundColor = UIColor.white
        let feedNavVC = UINavigationController(rootViewController: feedVC)
        
        let logInVC = LogInViewController()
        logInVC.view.backgroundColor = .white
        logInVC.delegate = loginInspector
        
        let profNavVC = UINavigationController(rootViewController: logInVC)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        feedNavVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "text.justify"), tag: 0)
        feedNavVC.navigationBar.titleTextAttributes = [ .foregroundColor: UIColor.black]
        feedNavVC.navigationBar.barTintColor = UIColor.white
        feedNavVC.navigationBar.standardAppearance = appearance
        feedNavVC.navigationBar.scrollEdgeAppearance = feedNavVC.navigationBar.standardAppearance
        
        profNavVC.tabBarItem = UITabBarItem( title: "Profile", image: UIImage(systemName: "person"), tag: 0)
        profNavVC.navigationBar.barTintColor = UIColor.white
        profNavVC.navigationBar.titleTextAttributes = [ .foregroundColor: UIColor.black]
        profNavVC.navigationBar.standardAppearance = appearance
        profNavVC.navigationBar.scrollEdgeAppearance = profNavVC.navigationBar.standardAppearance
        profNavVC.navigationBar.isHidden = true
        
        tabBarController.viewControllers = [profNavVC, feedNavVC]
        window.rootViewController = tabBarController
//        window.rootViewController = PhotosViewController()  // временная загрузка

        
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

