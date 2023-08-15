import UIKit



final class MainTabBar:UITabBarController {
    
    //MARK: - private Proportis
    private var feedVC = FactoryTabBar(flow: .feed)
    private var postVC = FactoryTabBar(flow: .post)
    private var likeVC = FactoryTabBar(flow: .likePost)
    private var mapVC = FactoryTabBar(flow: .map)
//    private let viewControlers: [UIViewController]
    
    //MARK: - Lifecycle
    
//    init(viewControlers:[UIViewController]) {
//        self.viewControllers = viewControlers
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
    }
    
    //MARK: - Method
    private func setController() {
        viewControllers = [
            postVC.navigationControllerFactory,
            feedVC.navigationControllerFactory,
            likeVC.navigationControllerFactory,
            mapVC.navigationControllerFactory
        ]
    }
}
