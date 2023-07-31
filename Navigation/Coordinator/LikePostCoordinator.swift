import UIKit


//MARK: - protocol

protocol PostLikeCoordinatorProtocol:AnyObject {
    var navigationController: UINavigationController? {get set}
    func showDetail()
    func pop()
}

//MARK: - class
class LikePostCoordinator:PostLikeCoordinatorProtocol {
    var navigationController: UINavigationController?
    
    //MARK: - Method
    func showDetail() {
        let postVC = UIViewController()
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    //MARK: - Proportis
    func pop() {
        navigationController?.popViewController(animated: true)
    }
}
