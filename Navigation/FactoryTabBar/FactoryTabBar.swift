import UIKit

class FactoryTabBar {
    
    //MARK: - enum
    enum Flow {
        case feed
        case post
        case likePost
        case map
    }
    
    //MARK: - Proportis
    let navigationControllerFactory = UINavigationController()
    private let feedModelFactory = FeedModel()
    private let flow:Flow
    
    
    //MARK: - Lifecycle
    init(flow: Flow) {
        self.flow = flow
        startModul()
    }
    
    //MARK: - Method
    private func startModul() {
        switch flow {
        case .feed:
            let feedCoordinator = FeedCoordinator()
            let feedModel = FeedModel()
            let feedViewModel = FeedViewModel(feedModel: feedModel,
                                              feedCoordinator: feedCoordinator)
            let feedViewController = FeedViewController(feedViewModel: feedViewModel)
            feedCoordinator.navigationController = navigationControllerFactory
            navigationControllerFactory.view.backgroundColor = .systemOrange
            let localize = NSLocalizedString("FeedTabBar", comment: "")
            navigationControllerFactory.tabBarItem = UITabBarItem(title: localize,
                                                                  image: UIImage(systemName: "figure.walk"),
                                                                  tag: 0)
            navigationControllerFactory.setViewControllers([feedViewController], animated: true)
            
        case .post:
            let postCoordinator = PostCoordinator()
            postCoordinator.navigationController = navigationControllerFactory
            let logInViewController = LogInViewController()
            let loginFactory = MyLoginFactory()
            let loginInspector = loginFactory.makeLoginInspector()
            logInViewController.loginDelegate = loginInspector
            navigationControllerFactory.view.backgroundColor = .white
            let localize = NSLocalizedString("LogTabBar", comment: "")
            navigationControllerFactory.tabBarItem = UITabBarItem(title: localize,
                                                                  image: UIImage(systemName: "brain.head.profile"),
                                                                  tag: 1)
            navigationControllerFactory.setViewControllers([logInViewController], animated: true)
            
        case .likePost:
            let likePostCoordinator = LikePostCoordinator()
            likePostCoordinator.navigationController = navigationControllerFactory
            let likePostViewController = LikePostViewController()
            navigationControllerFactory.view.backgroundColor = .white
            let localize = NSLocalizedString("likePostTabBar", comment: "")
            navigationControllerFactory.tabBarItem = UITabBarItem(title: localize,
                                                                  image: UIImage(systemName: "hand.thumbsup"),
                                                                  tag: 2)
            navigationControllerFactory.setViewControllers([likePostViewController], animated: true)
            
        case .map:
            let mapCoordinator = MapCoordinator()
            mapCoordinator.navigationController = navigationControllerFactory
            let mapViewController = MapViewController()
            navigationControllerFactory.view.backgroundColor = .white
            let localize = NSLocalizedString("MapTabBar", comment: "")
            navigationControllerFactory.tabBarItem = UITabBarItem(title: localize,
                                                                  image: UIImage(systemName: "map"),
                                                                  tag: 3)
            navigationControllerFactory.setViewControllers([mapViewController], animated: true)
        }
    }
}


