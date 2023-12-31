import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        
        let mainViewController = UINavigationController(rootViewController: MainViewController())
        let favoriteViewController =  UINavigationController(rootViewController: FavoritViewController())
        let adsViewController = UINavigationController(rootViewController: AdsViewController())
        let messegeViewController = UINavigationController(rootViewController: MessegeViewController())
        let otherViewController = UINavigationController(rootViewController: OtherViewController())
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [mainViewController, favoriteViewController, adsViewController, messegeViewController, otherViewController]
        mainViewController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        favoriteViewController.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(systemName: "bookmark.fill"), tag: 1)
        adsViewController.tabBarItem = UITabBarItem(title: "Объявления", image: UIImage(systemName: "note.text.badge.plus"), tag: 2)
        messegeViewController.tabBarItem = UITabBarItem(title: "Диалоги", image: UIImage(systemName: "ellipsis.bubble"), tag: 3)
        otherViewController.tabBarItem = UITabBarItem(title: "Прочее", image: UIImage(systemName: "text.justify"), tag: 4)

        window.rootViewController = tabBarController
        
        UITabBar.appearance().tintColor = UIColor.selectItemTabBat
        UITabBar.appearance().unselectedItemTintColor = UIColor.itemTabBar
        tabBarController.tabBar.backgroundColor = .tabBarCV
    
        self.window = window
        window.makeKeyAndVisible()
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


