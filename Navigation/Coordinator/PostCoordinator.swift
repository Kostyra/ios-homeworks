import UIKit


//MARK: - protocol

protocol PostCoordinatorProtocol:AnyObject {
    var navigationController: UINavigationController? {get set}
    func showDetail()
    func pop()
}

//MARK: - class
class PostCoordinator:PostCoordinatorProtocol {
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
