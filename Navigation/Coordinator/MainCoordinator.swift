

import UIKit

//MARK: - Protocol

protocol MainCoordinatorProtocol {
    func startAplication() -> UIViewController
}

//MARK: - Class

class MainCoordinator: MainCoordinatorProtocol {
    func startAplication() -> UIViewController {
        return MainTabBar()
    }
    
    
}


//extension MainCoordinator: CoordinatorProtocol {
//    func start() -> UIViewController {
//        let
//        let mainTabBarController = MainTabBar(viewControlers: <#T##[UIViewController]#>)
//    }
//}
