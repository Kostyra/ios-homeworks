import UIKit

class FactoryTabBar {
    
    //MARK: - enum
    enum Flow {
        case feed
        case post
        case likePost
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
            navigationControllerFactory.tabBarItem = UITabBarItem(title: "Feed",
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
            navigationControllerFactory.tabBarItem = UITabBarItem(title: "Log",
                                                                  image: UIImage(systemName: "brain.head.profile"),
                                                                  tag: 1)
            navigationControllerFactory.setViewControllers([logInViewController], animated: true)
            
        case .likePost:
            let likePostCoordinator = LikePostCoordinator()
            likePostCoordinator.navigationController = navigationControllerFactory
            let likePostViewController = LikePostViewController()
            navigationControllerFactory.view.backgroundColor = .white
            navigationControllerFactory.tabBarItem = UITabBarItem(title: "Log",
                                                                  image: UIImage(systemName: "hand.thumbsup"),
                                                                  tag: 1)
            navigationControllerFactory.setViewControllers([likePostViewController], animated: true)
        }
    }
}


