import UIKit


//MARK: - protocol

protocol FeedCoordinatorProtocol:AnyObject {
    var navigationController: UINavigationController? {get set}
    func showDetail()
    func pop()
}

//MARK: - class
final class FeedCoordinator:FeedCoordinatorProtocol {
    
    //MARK: - Proportis
     var navigationController: UINavigationController?
    
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
    
    
    //MARK: -  Method
    func showDetail() {
        let feedVC = UIViewController()
        navigationController?.pushViewController(feedVC, animated: true)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
}


//extension FeedCoordinator:CoordinatorProtocol {
//    func start() -> UIViewController {
//        let feedVC = UIViewController()
//        let nC = UINavigationController(rootViewController: feedVC)
//        self.navigationController = nC
//        return self.navigationController
//
//
//
//
//    }
//}
